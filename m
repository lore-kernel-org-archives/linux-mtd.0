Received: from nwd2mime2.analog.com ([137.71.25.114])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 1820DR-0002I9-00
	for <linux-mtd@lists.infradead.org>; Thu, 17 Oct 2002 03:16:49 +0100
Received: from nwd2gtw1 (unverified) by nwd2mime2.analog.com
 (Content Technologies SMTPRS 4.2.10) with SMTP id <T5dfbb0756c894719721b0@nwd2mime2.analog.com> for <linux-mtd@lists.infradead.org>;
 Wed, 16 Oct 2002 22:16:44 -0400
Received: from golf.cpgdesign.analog.com ([137.71.139.100]) by nwd2mhb2.analog.com with ESMTP (8.9.3 (PHNE_18979)/8.7.1) id WAA23558 for <linux-mtd@lists.infradead.org>; Wed, 16 Oct 2002 22:16:37 -0400 (EDT)
Received: from ws4.cpgdesign.analog.com (ws4 [137.71.139.26])
	by golf.cpgdesign.analog.com (8.9.1/8.9.1) with ESMTP id TAA26227
	for <linux-mtd@lists.infradead.org>; Wed, 16 Oct 2002 19:16:37 -0700 (PDT)
Received: from analog.com (localhost [127.0.0.1])
	by ws4.cpgdesign.analog.com (8.9.1/8.9.1) with ESMTP id TAA20650
	for <linux-mtd@lists.infradead.org>; Wed, 16 Oct 2002 19:16:36 -0700 (PDT)
Message-ID: <3DAE1D84.338F42B2@analog.com>
Date: Wed, 16 Oct 2002 19:16:36 -0700
From: Justin Wojdacki <justin.wojdacki@analog.com>
Reply-To: justin.wojdacki@analog.com
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: Re: Hoping for a little insight
References: <3DAC9026.B3F4550B@analog.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
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

Okay, so it looks like far more data is being written to flash than
should be. As an example, a 8205 byte file is occupying 15356 bytes of
actual flash (based on tracking writes). It looks like data is getting
repeatedly written to flash. So, if I have the pattern "ABCD", I see
written to flash:

A
AB
ABC
ABCD

Additionally, I see the flash being written in blocks of 512 bytes. I
have CONFIG_MTD_CFI and CONFIG_MTD_JEDEC_PROBE set in my
configuration, and the following entry added to jedec_probe.c:

	{
                mfr_id: MANUFACTURER_ST,
                dev_id: M29W320DB,   
                name: "ST M29W320DB",
                DevSize: SIZE_4MiB,
                NumEraseRegions: 4,
                regions: { ERASEINFO(16*1024,1),
                           ERASEINFO(8*1024,2),
                           ERASEINFO(32*1024,1),
                           ERASEINFO(64*1024,63)
                }
	}

Is this sufficient? Or should I have added an entry to amd_flash.c
instead and set CONFIG_MTD_AMDSTD? (Some devices are declared in both
jedec_probe.c and amd_flash.c so I'm a little unsure about how this
breaks down). 

-- 
-------------------------------------------------
Justin Wojdacki        
justin.wojdacki@analog.com         (408) 350-5032
Communications Processors Group -- Analog Devices
