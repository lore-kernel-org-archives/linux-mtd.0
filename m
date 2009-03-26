Received: from mail-bw0-f159.google.com ([209.85.218.159])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1LmnM9-00069Y-Oj
	for linux-mtd@lists.infradead.org; Thu, 26 Mar 2009 11:02:48 +0000
Received: by bwz3 with SMTP id 3so512066bwz.18
	for <linux-mtd@lists.infradead.org>;
	Thu, 26 Mar 2009 04:02:39 -0700 (PDT)
MIME-Version: 1.0
Date: Thu, 26 Mar 2009 12:02:38 +0100
Message-ID: <62cbdcd90903260402q61725160v7f1538762fbd76bc@mail.gmail.com>
Subject: Re: [PATCH] Fixup for Numonyx M29W128 chips
From: massimo cirillo <maxcir@gmail.com>
To: linux-mtd@lists.infradead.org, augulis.darius@gmail.com
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Darius,
what kind of failure did you experiment with M29W?

In my opinion, complete removal of the buffer program feature is not a
good solution,
because you are taking away an important feature of the device, that results in
a very high performance decrease.

Moreover, if you make the fix applicable to all devices with 0x227E device ID,
you are removing the same feature from other devices too, such as M29EW
that has a much bigger buffer thus resulting in a dramatic performance decrease
for this device.
