Received: from imladris.infradead.org
	([194.205.184.45] helo=infradead.org ident=root)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 159ite-0000Mi-00
	for <linux-mtd@lists.infradead.org>; Tue, 12 Jun 2001 08:47:31 +0100
Received: from beta.dmz-eu.st.com ([164.129.1.35])
	by infradead.org with esmtp (Exim 3.20 #2)
	id 159UqN-0001zm-00
	for linux-mtd@lists.infradead.org; Mon, 11 Jun 2001 17:47:11 +0100
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
	by beta.dmz-eu.st.com (STMicroelectronics) with SMTP id 160B2493A
	for <linux-mtd@lists.infradead.org>; Mon, 11 Jun 2001 16:42:22 +0000 (GMT)
Received: from thistle.bri.st.com (localhost [127.0.0.1])
	by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 74180184E
	for <linux-mtd@lists.infradead.org>; Mon, 11 Jun 2001 16:42:21 +0000 (GMT)
Received: from [164.129.14.5] (helo=ocelot)
	by thistle.bristol.st.com with esmtp (Exim 3.03 #5)
	id 159Ulf-00004L-00
	for linux-mtd@lists.infradead.org; Mon, 11 Jun 2001 17:42:19 +0100
From: Stuart Menefy <Stuart.Menefy@st.com>
Message-Id: <1010611174219.ZM25884@bristol.st.com>
Date: Mon, 11 Jun 2001 17:42:18 +0100
To: linux-mtd@lists.infradead.org
Subject: CFI JEDEC probing
MIME-Version: 1.0
Content-Type: multipart/mixed;
	boundary="PART-BOUNDARY=.11010611174218.ZM25884.st.com"
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

--
--PART-BOUNDARY=.11010611174218.ZM25884.st.com
Content-Type: text/plain; charset=us-ascii

Folks

I think I've come across a limitation in the CFI JEDEC proving code.

I'm working with four ST M29W160DT devices, mapped as follows:

x               data bus
x
x           D31    D16   D15     D0
x            |      |     |      |
x            |      |     |      |
x        0 +----------+ +----------+
x          |D15     D0| |D15     D0|
x          |          | |          |
x   3fffff |          | |          |
x          +----------+ +----------+
x            |      |     |      |
x   400000 +----------+ +----------+
x          |D15     D0| |D15     D0|
x          |          | |          |
x   7fffff |          | |          |
x          +----------+ +----------+
x

Humm, not sure if that makes things clearer or not! What I'm trying to
say is, four 16 bit devices, on a 32bit data bus, with an interleave
of 2, mapped into contiguous memory locations.

When probing for the first two devices, the code in cfi_jedec_lookup()
only appears to only be able to handle an interleave of 1.

I've added code which works for me and generates the appropriate
device and manufacturer ID's, based on the bus width and interleave,
for comparison with the values read back from the Flash devices.
A copy of the code is attached. Do you think this is generally useful,
or have I missed something obvious?

Thanks

Stuart

--PART-BOUNDARY=.11010611174218.ZM25884.st.com
Content-Description: Text
Content-Type: text/plain ; name="mtd_patch2" ; charset=us-ascii
Content-Disposition: attachment ; filename="mtd_patch2"
X-Zm-Content-Name: mtd_patch2

Index: drivers/mtd/chips/cfi_jedec.c
===================================================================
RCS file: /home/cvs/mtd/drivers/mtd/chips/cfi_jedec.c,v
retrieving revision 1.5
diff -c -r1.5 cfi_jedec.c
*** drivers/mtd/chips/cfi_jedec.c	2001/06/02 14:52:23	1.5
--- drivers/mtd/chips/cfi_jedec.c	2001/06/11 16:39:37
***************
*** 246,261 ****
  	} 
  };
  
! int cfi_jedec_lookup(int index, int mfr_id, int dev_id)
  {
    	if (index>=0){
! 		if (jedec_table[index].mfr_id == mfr_id &&
! 		    jedec_table[index].dev_id == dev_id) return index;
    	}
    	else{
  		for (index=0; jedec_table[index].mfr_id; index++){
! 		    if (jedec_table[index].mfr_id == mfr_id &&
! 		        jedec_table[index].dev_id == dev_id) return index;
  		}
    	}
  	return -1;
--- 246,304 ----
  	} 
  };
  
! /*
!  * Transforms the ID for the given geometry (bus width & interleave).
!  * This is a slightly modified version of cfi_build_cmd, in that it copes
!  * with truncating down a 16 bit ID to 8 bits when required.
!  */
! static __u32 cfi_build_id(__u16 id, struct map_info *map, int interleave)
  {
+ 	__u32 val = 0;
+ 
+ 	if (cfi_buswidth_is_1()) {
+ 		/* 1 x8 device */
+ 		val = id & 0xff;
+ 	} else if (cfi_buswidth_is_2()) {
+ 		if (cfi_interleave_is_1()) {
+ 			/* 1 x16 device in x16 mode */
+ 			val = cpu_to_cfi16(id);
+ 		} else if (cfi_interleave_is_2()) {
+ 			/* 2 (x8, x16 or x32) devices in x8 mode */
+ 			id &= 0xff;
+ 			val = cpu_to_cfi16((id << 8) | id);
+ 		}
+ 	} else if (cfi_buswidth_is_4()) {
+ 		if (cfi_interleave_is_1()) {
+ 			/* 1 x32 device in x32 mode */
+ 			val = cpu_to_cfi32(id);
+ 		} else if (cfi_interleave_is_2()) {
+ 			/* 2 x16 device in x16 mode */
+ 			val = cpu_to_cfi32((id << 16) | id);
+ 		} else if (cfi_interleave_is_4()) {
+ 			/* 4 (x8, x16 or x32) devices in x8 mode */
+ 			id &= 0xff;
+ 			val = (id << 16) | id;
+ 			val = cpu_to_cfi32((val << 8) | val);
+ 		}
+ 	}
+ 	return val;
+ }
+ 
+ int cfi_jedec_lookup(int index, int mfr_id, int dev_id, struct map_info *map, int interleave)
+ {
+ 	printk("buswidth %d, interleave %d\n", map->buswidth, interleave);
    	if (index>=0){
! 		const __u32 dev_mfr_id = cfi_build_id(jedec_table[index].mfr_id, map, interleave);
! 		const __u32 dev_dev_id = cfi_build_id(jedec_table[index].dev_id, map, interleave);
! 		if (dev_mfr_id == mfr_id && dev_dev_id == dev_id) return index;
    	}
    	else{
  		for (index=0; jedec_table[index].mfr_id; index++){
! 		    const __u32 dev_mfr_id = cfi_build_id(jedec_table[index].mfr_id, map, interleave);
! 		    const __u32 dev_dev_id = cfi_build_id(jedec_table[index].dev_id, map, interleave);
! 		    printk("Comp %08x %08x and %08x %08x\n",
! 			   dev_mfr_id, mfr_id, dev_dev_id, dev_id);
! 		    if (dev_mfr_id == mfr_id && dev_dev_id == dev_id) return index;
  		}
    	}
  	return -1;

--PART-BOUNDARY=.11010611174218.ZM25884.st.com--
