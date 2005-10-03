Received: from [195.209.228.254] (helo=shelob.oktetlabs.ru)
	by canuck.infradead.org with esmtps (Exim 4.52 #1 (Red Hat Linux))
	id 1EMQiR-0006bv-R3
	for linux-mtd@lists.infradead.org; Mon, 03 Oct 2005 09:51:04 -0400
Message-ID: <43413716.1040402@yandex.ru>
Date: Mon, 03 Oct 2005 17:50:14 +0400
From: "Artem B. Bityutskiy" <dedekind@yandex.ru>
MIME-Version: 1.0
To: zhao forrest <zhao_fusheng@hotmail.com>
References: <BAY17-F15F41E3E64959C3F1054D0E8800@phx.gbl>
In-Reply-To: <BAY17-F15F41E3E64959C3F1054D0E8800@phx.gbl>
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: [PATCH]erase block header(revision 4)
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

zhao forrest wrote:
> Artem asked me to remove allocation on the stack, so who should I listen 
> to? This really made me very very confused :(
Yes, I suggested to share one static clean-marker structure for both
NAND and NOR cases.

>> What was (c->cleanmarker_size == 0) used for?
> 
> For the flash that don't need a clean marker.
No, that worked for NAND this way (c->cleanmarker_size was 0)

-- 
Best Regards,
Artem B. Bityuckiy,
St.-Petersburg, Russia.
