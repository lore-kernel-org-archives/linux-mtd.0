Received: from nwd2mime2.analog.com ([137.71.25.114])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17Fhry-0006rh-00
	for <linux-mtd@lists.infradead.org>; Wed, 05 Jun 2002 21:59:02 +0100
Received: from nwd2gtw1 (unverified) by nwd2mime2.analog.com
 (Content Technologies SMTPRS 4.2.5) with SMTP id <T5b4da070a689471972101@nwd2mime2.analog.com> for <linux-mtd@lists.infradead.org>;
 Wed, 5 Jun 2002 16:59:44 -0400
Received: from golf.cpgdesign.analog.com ([137.71.139.100]) by nwd2mhb2.analog.com with ESMTP (8.9.3 (PHNE_18979)/8.7.1) id QAA22078 for <linux-mtd@lists.infradead.org>; Wed, 5 Jun 2002 16:58:50 -0400 (EDT)
Received: from ws4.cpgdesign.analog.com (ws4 [137.71.139.26])
	by golf.cpgdesign.analog.com (8.9.1/8.9.1) with ESMTP id NAA15305
	for <linux-mtd@lists.infradead.org>; Wed, 5 Jun 2002 13:58:49 -0700 (PDT)
Received: from analog.com (localhost [127.0.0.1])
	by ws4.cpgdesign.analog.com (8.9.1/8.9.1) with ESMTP id NAA21450
	for <linux-mtd@lists.infradead.org>; Wed, 5 Jun 2002 13:58:49 -0700 (PDT)
Message-ID: <3CFE7B89.1EDA745@analog.com>
Date: Wed, 05 Jun 2002 13:58:49 -0700
From: Justin Wojdacki <justin.wojdacki@analog.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: Re: Strange problem related to writing to flash
References: <3CFD131D.1AA4678F@analog.com> <15613.16180.337384.910293@gargle.gargle.HOWL> <3CFD502E.870C7AFA@analog.com>
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

Justin Wojdacki wrote:
> 
> That's along the lines of what a few of us discussed here, except for
> one issue:
> 
> The bootstrap isn't part of the kernel. So the bootstrap has no
> problem running, loading the kernel from flash, and then executing the
> kernel. Seems to me that that wouldn't be possible if the flash wasn't
> in read mode (unless I'm missing something). The bootstrap being used
> has to ID the flash device itself, so if it can ID it and read from it
> fine, the kernel should be able to also right?
> 

Some more information:

The flash is clearly in the read state when the kernel boots. 

It looks like the first few passes of cfi_check_qry_or_id() don't
actually get the manufacturer or device ID when this fails. It's not
until the case where interleave = 2 and device_type = 1 that I see a
correct ID happening. I'll post more information when I have more
details into what's going on here. 

-- 
-------------------------------------------------
Justin Wojdacki        
justin.wojdacki@analog.com         (408) 350-5032
Communications Processors Group -- Analog Devices
