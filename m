Received: from imladris.demon.co.uk ([193.237.130.41])
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19M6Fl-0003fc-92
	for <linux-mtd@lists.infradead.org>; Sat, 31 May 2003 14:18:33 +0100
From: David Woodhouse <dwmw2@infradead.org>
To: Zachi Friedman <zachi.friedman@m-sys.com>
In-Reply-To: <1054386483.8432.5.camel@imladris.demon.co.uk>
References: <NEBBLJGMNKKEEMNLHGAIKEFKDAAA.mdharm@momenco.com>
	 <1052490354.23135.208.camel@passion.cambridge.redhat.com>
	 <1052490920.23135.215.camel@passion.cambridge.redhat.com>
	 <1054386483.8432.5.camel@imladris.demon.co.uk>
Message-Id: <1054387153.8432.30.camel@imladris.demon.co.uk>
Mime-Version: 1.0
Date: Sat, 31 May 2003 14:19:13 +0100
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
cc: linux-mtd@lists.infradead.org
Subject: RE: DiskOnChip 2000 128Mb problem
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Zachi Friedman <zachi.friedman@m-sys.com> writes:
> So, once you have chip ID of 0x30, how can you tell whether it's a
> Millennium or the newer DiskOnChip 2000?  You have to read chip ID 4 
> times. If the 4th read is NOT 0x30 - it's a new DiskOnChip 2000 !

Thanks for the information. You say it has a new ASIC -- other than the
ChipID, in what other ways does it behave like a Millennium rather than
a DiskOnChip 2000?

It looks like it was passing the Millennium version of the 'toggle'
test, where we read the ECCConf register, rather than the DiskOnChip
2000 version where we read the 2k_ECCStatus register.

What are the contents of the fourth read supposed to be? 0x20 as we'd
expect from a DiskOnChip 2000? Should we just read the ChipID four times
and discard the first three, or do something like...

--- docprobe.c  23 May 2003 11:29:34 -0000      1.36
+++ docprobe.c  31 May 2003 13:18:37 -0000
@@ -137,19 +137,31 @@ static inline int __init doccheck(unsign
  
        ChipID = ReadDOC(window, ChipID);
    
        switch (ChipID) {
        case DOC_ChipID_Doc2k:
+       really2k:
                /* Check the TOGGLE bit in the ECC register */
                tmp  = ReadDOC(window, 2k_ECCStatus) & DOC_TOGGLE_BIT;
                tmpb = ReadDOC(window, 2k_ECCStatus) & DOC_TOGGLE_BIT;
                tmpc = ReadDOC(window, 2k_ECCStatus) & DOC_TOGGLE_BIT;
                if (tmp != tmpb && tmp == tmpc)
                                return ChipID;
                break;
  
        case DOC_ChipID_DocMil:
+               /* If we read the ID four times and it changes, then
+                  it wasn't really a Millennium; it was a newer
+                  DiskOnChip 2000. Pass me the baseball bat. */
+               ChipID = ReadDOC(window, ChipID);
+               ChipID = ReadDOC(window, ChipID);
+               ChipID = ReadDOC(window, ChipID);
+               if (ChipID != DOC_ChipID_DocMil) {
+                       printk(KERN_DEBUG "New DiskOnChip 2000 with bizarre ChipID detected. %02x on fourth read.\n", ChipID);
+                       goto really2k;
+               }
+
                /* Check the TOGGLE bit in the ECC register */
                tmp  = ReadDOC(window, ECCConf) & DOC_TOGGLE_BIT;
                tmpb = ReadDOC(window, ECCConf) & DOC_TOGGLE_BIT;
                tmpc = ReadDOC(window, ECCConf) & DOC_TOGGLE_BIT;
                if (tmp != tmpb && tmp == tmpc)



-- 
dwmw2
