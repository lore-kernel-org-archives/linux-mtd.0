Received: from nwd2mime2.analog.com ([137.71.25.114])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 181vy8-0001rO-00
	for <linux-mtd@lists.infradead.org>; Wed, 16 Oct 2002 22:44:44 +0100
Received: from nwd2gtw1 (unverified) by nwd2mime2.analog.com
 (Content Technologies SMTPRS 4.2.10) with SMTP id <T5dfab76049894719721b0@nwd2mime2.analog.com> for <linux-mtd@lists.infradead.org>;
 Wed, 16 Oct 2002 17:44:40 -0400
Received: from golf.cpgdesign.analog.com ([137.71.139.100]) by nwd2mhb1.analog.com with ESMTP (8.9.3 (PHNE_18979)/8.7.1) id RAA06158 for <linux-mtd@lists.infradead.org>; Wed, 16 Oct 2002 17:44:33 -0400 (EDT)
Received: from ws4.cpgdesign.analog.com (ws4 [137.71.139.26])
	by golf.cpgdesign.analog.com (8.9.1/8.9.1) with ESMTP id OAA15675
	for <linux-mtd@lists.infradead.org>; Wed, 16 Oct 2002 14:44:31 -0700 (PDT)
Received: from analog.com (localhost [127.0.0.1])
	by ws4.cpgdesign.analog.com (8.9.1/8.9.1) with ESMTP id OAA20369
	for <linux-mtd@lists.infradead.org>; Wed, 16 Oct 2002 14:44:31 -0700 (PDT)
Message-ID: <3DADDDBF.9EABA480@analog.com>
Date: Wed, 16 Oct 2002 14:44:31 -0700
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

FYI for those who might be able to help:

The filesystem has ~2MB free. I'm copying a 600K file from one
directory to another. The filesystem is reporting that it's running
out of space to garbage collect and the write process is hanging. 

-- 
-------------------------------------------------
Justin Wojdacki        
justin.wojdacki@analog.com         (408) 350-5032
Communications Processors Group -- Analog Devices
