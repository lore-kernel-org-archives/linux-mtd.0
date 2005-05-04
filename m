Received: from v-mail.vsnl.com ([202.54.117.17] helo=vmail.vsnl.com)
	by canuck.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1DTGUm-0001WU-G5
	for linux-mtd@lists.infradead.org; Wed, 04 May 2005 05:48:45 -0400
Received: from [10.50.41.164] ([127.0.0.1])
	by vmail.vsnl.com (iPlanet Messaging Server 5.2 HotFix 1.16 (built May
	14 2003)) with ESMTP id <0IFY000UZLX36T@vmail.vsnl.com> for
	linux-mtd@lists.infradead.org; Wed, 04 May 2005 15:18:40 +0530 (IST)
Date: Wed, 04 May 2005 15:17:14 +0530
From: "amareesh@tataelxsi.co.in" <amareesh@tataelxsi.co.in>
To: linux-mtd@lists.infradead.org
Message-id: <1115200034.3851.11.camel@localhost.localdomain>
MIME-version: 1.0
Content-type: text/plain
Content-transfer-encoding: 7BIT
Subject: Booting from onboard flash
Reply-To: amareesh@tataelxsi.co.in
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi 

Plzz help me on this. .
I want to boot Linux image straight from my onboard flash.

WHat i have ::

1. Motorola coldfire 5272C3 based board.
2. Complied uClinux for the same.
3. have the image for LINUX +FILESYSTEM(romfs)
4. Have copied this image to flash.

What i wanna do :

I want to use the dBug option go <start address> to boot straight from
flash.
As of now, It is not doing so after i replug the power cable. 
I have to copy the entire image block from the flash to RAm and then
give the command 'go <RAMaddress>'. 

Can anyone plzz help me on this.

Amareesh
