Received: from smtp.nokia.com ([192.100.105.134] helo=mgw-mx09.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1N6gyG-00044P-E5
	for linux-mtd@lists.infradead.org; Sat, 07 Nov 2009 08:48:36 +0000
Subject: Re: can UBIFS be NFS exported
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Norbert van Bolhuis <nvbolhuis@aimvalley.nl>
In-Reply-To: <4AF2DE80.5010808@aimvalley.nl>
References: <4AF2DE80.5010808@aimvalley.nl>
Content-Type: text/plain; charset="UTF-8"
Date: Sat, 07 Nov 2009 10:48:12 +0200
Message-Id: <1257583692.21596.116.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2009-11-05 at 15:17 +0100, Norbert van Bolhuis wrote:
> just to make sure. UBIFS can not be NFS exported, is this correct ?
> 
> (I need NFS in our distributed system. The server uses UBIFS.
>   But there is a ISO9660 image on our UBIFS and fortunately
>   ISO(Z)FS can be NFS exported, so it's not a problem)

Hi, not, it does not support NFS and you would need to implement the
support. Hake a look here:

http://www.linux-mtd.infradead.org/faq/ubifs.html#L_nfs

(Rload the page, because I've just updated it)

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
