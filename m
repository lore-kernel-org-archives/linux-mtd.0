Received: from nz-out-0506.google.com ([64.233.162.229])
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1Ho5BW-00021S-Va
	for linux-mtd@lists.infradead.org; Tue, 15 May 2007 18:07:59 -0400
Received: by nz-out-0506.google.com with SMTP id i11so838422nzi
	for <linux-mtd@lists.infradead.org>;
	Tue, 15 May 2007 15:07:57 -0700 (PDT)
Message-ID: <79ac09b60705151507g63246e8dh76801456c0a68e78@mail.gmail.com>
Date: Tue, 15 May 2007 17:07:56 -0500
From: Duke <ezbonites@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: block erase error: (bad VPP)
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,
I've been getting these errors for a while now and I'm not sure why.
I get thess when I boot the system and It shouldn't be trying to erase anything.
I boot with
root=/dev/mtdblock2 rootfstype=cramfs
mtdparts=physmap-flash.0:0x40000(boot),0x180
000(kernel),0x640000(root),0x400000(var),-(str)

Can someone tell me why this happens?


physmap-flash.0: block erase error: (bad VPP)
Erase at 0x00180000 failed immediately: errno -5
physmap-flash.0: block erase error: (bad VPP)
Erase at 0x00140000 failed immediately: errno -5
physmap-flash.0: block erase error: (bad VPP)
Erase at 0x00100000 failed immediately: errno -5
physmap-flash.0: block erase error: (bad VPP)
Erase at 0x000c0000 failed immediately: errno -5
physmap-flash.0: block erase error: (bad VPP)
...

Thanks,
D.
