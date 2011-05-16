Received: from mail-ew0-f49.google.com ([209.85.215.49])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QLvPD-00054J-6D
	for linux-mtd@lists.infradead.org; Mon, 16 May 2011 10:52:07 +0000
Received: by ewy3 with SMTP id 3so1414511ewy.36
	for <linux-mtd@lists.infradead.org>;
	Mon, 16 May 2011 03:52:05 -0700 (PDT)
Subject: Re: [PATCH 16/20] UBIFS: expect corruption only in last journal
	head LEBs
From: Artem Bityutskiy <dedekind1@gmail.com>
To: MTD list <linux-mtd@lists.infradead.org>
In-Reply-To: <1305531879-19311-17-git-send-email-dedekind1@gmail.com>
References: <1305531879-19311-1-git-send-email-dedekind1@gmail.com>
	<1305531879-19311-17-git-send-email-dedekind1@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Mon, 16 May 2011 13:48:42 +0300
Message-ID: <1305542922.2630.0.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2011-05-16 at 10:44 +0300, Artem Bityutskiy wrote:
> +/* TODO: comment */
> +static int is_last_bud(struct ubifs_info *c, struct bud_entry *b)

Oh, forgot to add a comment
-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
