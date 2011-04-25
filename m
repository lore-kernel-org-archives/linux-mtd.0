Received: from mail-fx0-f49.google.com ([209.85.161.49])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1QEKhf-0007Mi-Ry
	for linux-mtd@lists.infradead.org; Mon, 25 Apr 2011 12:15:48 +0000
Received: by fxm14 with SMTP id 14so1754813fxm.36
	for <linux-mtd@lists.infradead.org>;
	Mon, 25 Apr 2011 05:15:45 -0700 (PDT)
Subject: RE: [PATCH 4/5] UBIFS: remove strange commentary
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Atlant Schmidt <aschmidt@dekaresearch.com>
In-Reply-To: <0A40042D85E7C84DB443060EC44B3FD32A694157A2@dekaexchange07.deka.local>
References: <1303651565-18302-1-git-send-email-dedekind1@gmail.com>
	<0A40042D85E7C84DB443060EC44B3FD32A694157A2@dekaexchange07.deka.local>
Content-Type: text/plain; charset="UTF-8"
Date: Mon, 25 Apr 2011 15:12:14 +0300
Message-ID: <1303733534.2778.12.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: MTD list <linux-mtd@lists.infradead.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2011-04-25 at 06:51 -0400, Atlant Schmidt wrote:
> Folks:
> 
> > /* 'generic_file_mmap()' takes care of NOMMU case */
> >
> > I do not understand what it means,
> 
>   It sounds like there must be / must have been code
>   to handle memory mapping in systems that do not
>   have a Memory Management Unit (an MMU providing
>   virtual-to-physical address translation).

Yes, must be "must have been" :-)

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
