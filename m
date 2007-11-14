Received: from rv-out-0910.google.com ([209.85.198.186])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1IsJMY-0001ln-RY
	for linux-mtd@lists.infradead.org; Wed, 14 Nov 2007 09:37:14 -0500
Received: by rv-out-0910.google.com with SMTP id c24so177005rvf
	for <linux-mtd@lists.infradead.org>;
	Wed, 14 Nov 2007 06:36:57 -0800 (PST)
Date: Wed, 14 Nov 2007 08:36:48 -0600
From: Josh Boyer <jwboyer@gmail.com>
To: "Jesper Saxtorph" <Jesper.Saxtorph@prevas.dk>
Subject: Re: Wrong data CRC in data node
Message-ID: <20071114083648.11cc22ac@weaponx>
In-Reply-To: <F0D565FB8733054DAF4888820C74C98D234AE3@prevas1.prevas.se>
References: <F0D565FB8733054DAF4888820C74C98D234AE3@prevas1.prevas.se>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 14 Nov 2007 13:23:32 +0100
"Jesper Saxtorph" <Jesper.Saxtorph@prevas.dk> wrote:

> I wonder if there can be some kind of cache active (in 2.6.19 contra 2.6.12) we
> are not aware of, that we should deactivate.
> 
> Is this a know this issue?
> 
> Any suggestions to what I could try?

Check to see if CONFIG_JFFS2_FS_WRITEBUFFER is set.  If so, you can try
turning that off.

josh
