Received: from chfdns01.ch.intel.com ([143.182.246.24] helo=pan.ch.intel.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15xsOl-0005Hd-00
	for <linux-mtd@lists.infradead.org>; Sun, 28 Oct 2001 16:02:55 +0000
Received: from hasmsxvs01.iil.intel.com (hasmsxvs01.iil.intel.com [143.185.63.58])
	by pan.ch.intel.com (8.9.1a+p1/8.9.1/d: relay.m4,v 1.46 2001/10/25 21:02:55 root Exp $) with SMTP id QAA14341
	for <linux-mtd@lists.infradead.org>; Sun, 28 Oct 2001 16:12:11 GMT
Message-ID: <7C0E66E1B97BD5119B120002A50A63D22E41EE@hasmsx101.iil.intel.com>
From: "Kremer, Alex" <alex.kremer@intel.com>
To: "'Larry Doolittle'" <ldoolitt@recycle.lbl.gov>,
        linux-mtd@lists.infradead.org
Subject: RE: TE28F320B3B madness :(
Date: Sun, 28 Oct 2001 18:11:59 +0200
MIME-Version: 1.0
Content-Type: text/plain;
	charset="ISO-8859-1"
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

| From: Larry Doolittle [mailto:ldoolitt@recycle.lbl.gov]
| 
| > You will need to replace  "cfi_probe" with "jedec_probe" in 
| do_map_probe()
| > from the maps driver (drivers/mtd/maps) you are using.
| 
| That's quite true.  Correct me if I'm wrong, but I think it
| should _always_ be safe to probe for JEDEC first, and CFI
| second.  So _all_ the mtd/maps drivers should do this,
| and there should in fact be a systematic method that they
| all use.  Like having a "map_flash" virtual probe that calls
| first "jedec" and then "cfi_probe", if and only if each in
| turn is compiled into the kernel.

I'm still trying to contact the right people on false QRY from a B3 so
"cfi_probe",
then "jedec_probe" would work always. I didn't get any reply yet...

Maybe there is a smart way in use somewhere else in kernel to
set priorities (ordering), so there can be a mtd_register_probe()
which would be called from the module init.

If not, a single map_flash() would be really appreciated.

I think that replacing every do_map_probe("cfi_probe", ?) with 
a call to the following would get the most from the current chip support:

struct mtd_info *map_probe_flash(struct map_info *map) {

	char *probes[] = {
#ifdef CONFIG_MTD_CFI
		"cfi_probe",
#endif
#ifdef CONFIG_MTD_JEDECPROBE
		"jedec_probe",
#endif
#ifdef CONFIG_MTD_ROM
		"map_rom",
#endif
		NULL
	};

      mtd_info *mymtd = NULL;
	
      while (*probes && !(mymtd = do_map_probe(*(probes++), map)))
		;

      return mymtd;
}

Kreso
