Received: from mg01.austin.ibm.com ([192.35.232.18])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17aLtg-0001km-00
	for <linux-mtd@lists.infradead.org>; Thu, 01 Aug 2002 20:46:08 +0100
Received: from austin.ibm.com (netmail.austin.ibm.com [9.3.7.137])
	by mg01.austin.ibm.com (AIX4.3/8.9.3/8.9.3) with ESMTP id OAA27000
	for <linux-mtd@lists.infradead.org>; Thu, 1 Aug 2002 14:44:52 -0500
Received: from popmail.austin.ibm.com (popmail.austin.ibm.com [9.53.247.178])
	by austin.ibm.com (AIX4.3/8.9.3/8.9.3) with ESMTP id OAA38756
	for <linux-mtd@lists.infradead.org>; Thu, 1 Aug 2002 14:46:04 -0500
Received: from mahi190.austin.ibm.com (mahi190.austin.ibm.com [9.3.154.190]) by popmail.austin.ibm.com (AIX4.3/8.9.3/8.7-client1.01) with ESMTP id OAA31174 for <linux-mtd@lists.infradead.org>; Thu, 1 Aug 2002 14:46:03 -0500
Subject: Re: "Read-only file system" error while writing
From: Stephen Hui <gromit1463@mailworks.org>
To: linux-mtd@lists.infradead.org
In-Reply-To: <20020801192624.28fe7b7e.stuart.menefy@st.com>
References: <1028147069.12139.81.camel@mahi190.austin.ibm.com>
	<1028064443.23642.52.camel@mahi190.austin.ibm.com>
	<20020731163530.70c45960.stuart.menefy@st.com>
	<28851.1028197900@redhat.com>
	<20020801190500.7e73cf60.stuart.menefy@st.com>
	<20020801192624.28fe7b7e.stuart.menefy@st.com>
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Date: 01 Aug 2002 14:45:45 -0500
Message-Id: <1028231145.22264.9.camel@mahi190.austin.ibm.com>
Mime-Version: 1.0
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

Number of erase regions: 2 
Vendor 00000020 id 000000ba 
Primary Vendor Command Set: 0003 (Intel/Sharp Standard) 
Primary Algorithm Table at 0035 
Alternative Vendor Command Set: 0000 (None) 
No Alternate Algorithm Table 
Vcc Minimum: 2.7 V 
Vcc Maximum: 3.6 V 
Vpp Minimum: b.4 V 
Vpp Maximum: c.6 V 
Typical byte/word write timeout: 16 s 
Maximum byte/word write timeout: 512 s 
Typical full buffer write timeout: 16 s 
Maximum full buffer write timeout: 512 s 
Typical block erase timeout: 1024 s 
Maximum block erase timeout: 8192 s 
Chip erase not supported 
Device size: 0x400000 bytes (4 Mb) 
Flash Device Interface description: 0x0001 
x16-only asynchronous interface 
Max. bytes in buffer write: 0x4 
Number of Erase Block Regions: 2 
Erase Region #0: BlockSize 0x10000 bytes, 63 blocks 
Erase Region #1: BlockSize 0x2000 bytes, 8 blocks 



I have 8 chips total, 4MB each.


On Thu, 2002-08-01 at 13:26, Stuart Menefy wrote:
> Try building cfi_probe.c with DEBUG_CFI set, and post what it reports.


-- 
"Find out what you've been missing while you've been
rebooting Windows NT." -- Infoworld on Linux

http://www.ao.com/~regan/penguins/tux.html
