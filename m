Received: from mail.fh-wedel.de ([195.37.86.23])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16uVns-00045L-00
	for <linux-mtd@lists.infradead.org>; Mon, 08 Apr 2002 10:51:12 +0100
Date: Mon, 8 Apr 2002 11:51:08 +0200
From: =?iso-8859-1?Q?J=F6rn_Engel?= <joern@wohnheim.fh-wedel.de>
To: =?iso-8859-1?Q?Marcos_Lois_Berm=FAdez?= <marcos@iqc-services.com>
Cc: linux-mtd@lists.infradead.org
Subject: Re: Creating the /dev devices
Message-ID: <20020408115108.A32219@wohnheim.fh-wedel.de>
References: <5.1.0.14.2.20020408103956.01f944b0@pop3.iqc-services.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5.1.0.14.2.20020408103956.01f944b0@pop3.iqc-services.com>; from marcos@iqc-services.com on Mon, Apr 08, 2002 at 10:41:05AM +0200
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

On Mon, 8 April 2002 10:41:05 +0200, Marcos Lois Bermúdez wrote:
> I have get the MTD work, but i can't see any mtd device under /dev
> How i can create it¿?

man mknod
less /usr/src/linux/Documentation/devices.txt

Something like this should do it:
mknod /etc/mtdblock0 b 31 0
mknod /etc/mtdblock1 b 31 1
mknod /etc/mtdblock2 b 31 2
mknod /etc/mtd0 c 90 0
mknod /etc/mtd1 c 90 2
mknod /etc/mtd2 c 90 4

You get the idea.

Jörn

-- 
Do not stop an army on its way home.
-- Sun Tzu
