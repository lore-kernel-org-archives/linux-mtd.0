Received: from mail4.asianet.co.th ([203.144.222.217] helo=mail.asianet.co.th)
	by canuck.infradead.org with esmtp (Exim 4.33 #1 (Red Hat Linux))
	id 1BxN6n-0005DX-SB
	for linux-mtd@lists.infradead.org; Wed, 18 Aug 2004 05:51:55 -0400
Received: from virscan3.asianet.co.th (HELO mail.asianet.co.th)
	([203.144.222.224]) (envelope-sender <jay4mail@yahoo.com>)
	by mail4.asianet.co.th (qmail-ldap-1.03) with SMTP
	for <linux-mtd@lists.infradead.org>; 18 Aug 2004 16:52:01 +0700
Message-ID: <412326B0.2060801@yahoo.com>
Date: Wed, 18 Aug 2004 16:51:44 +0700
From: Pathompong Puengrostham <jay4mail@yahoo.com>
MIME-Version: 1.0
To: David Woodhouse <dwmw2@infradead.org>
References: <4122D157.7070702@yahoo.com>
	<1092813016.3777.52.camel@imladris.demon.co.uk>
In-Reply-To: <1092813016.3777.52.camel@imladris.demon.co.uk>
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: amd_flash.c not compile
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

David Woodhouse wrote:
> On Wed, 2004-08-18 at 10:47 +0700, Pathompong Puengrostham wrote:
> 
>>I tried to use mtd 20040816 snapshot with linux 2.6.8.1 but there was a 
>>compile errors in amd_flash.c. The latest version I can get it working 
>>is 20040707. I read the cvs archive and saw that there was changes in 
>>map.h that broke all the devices. Is there anybody already working on 
>>this same file or get it working with the latest snapshot? Anyway, I'll 
>>try to fix it.
> 
> 
> amd_flash.c has been deprecated for a long time. You should find that
> jedec_probe and cfi_cmdset_0002 work for you. Please test.
> 
Yes, it works. Thank you so much.

Jay
