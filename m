Received: from patan.sun.com ([192.18.98.43])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15NOZA-0003yC-00
	for <linux-mtd@lists.infradead.org>; Fri, 20 Jul 2001 01:54:52 +0100
Received: from hsmtv32a.SFBay.Sun.COM ([129.145.120.36])
	by patan.sun.com (8.9.3+Sun/8.9.3) with ESMTP id TAA09158
	for <linux-mtd@lists.infradead.org>; Thu, 19 Jul 2001 19:00:32 -0600 (MDT)
Received: from sun.com (natbox [129.145.120.47])
	by hsmtv32a.SFBay.Sun.COM (8.9.3+Sun/8.9.3/ENSMAIL,v2.1p1) with ESMTP id SAA14764
	for <linux-mtd@lists.infradead.org>; Thu, 19 Jul 2001 18:00:33 -0700 (PDT)
Message-ID: <3B578432.2030701@sun.com>
Date: Thu, 19 Jul 2001 18:06:58 -0700
From: Tim Hockin <thockin@sun.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: Re: writing to flash
References: <3B576FA9.C36441A@sun.com>
Content-Type: text/plain; charset=us-ascii; format=flowed
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

Tim Hockin wrote:

> Is there a reason nothing uses copy_to() methods except map_ram?
> 
> It seems strange that for every byte I want to write to my flash chip, I
> have to execute 3 one-byte writes, when I could use copy_to().
> 
> Is there any reason we don't?
> 
> 


On the off chance that someone replied to my Q - Mozilla ate my mail for 
the last 30 minutes - resend?

-- 
Tim Hockin
Systems Software Engineer
Sun Microsystems, Cobalt Server Appliances
thockin@sun.com
