Received: from mail-vb0-f44.google.com ([209.85.212.44])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1TvnSY-0002Ss-Eo
 for linux-mtd@lists.infradead.org; Thu, 17 Jan 2013 11:16:39 +0000
Received: by mail-vb0-f44.google.com with SMTP id fc26so2342031vbb.17
 for <linux-mtd@lists.infradead.org>; Thu, 17 Jan 2013 03:16:37 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <1358265384-23138-1-git-send-email-schneider@at.festo.com>
References: <1358265384-23138-1-git-send-email-schneider@at.festo.com>
Date: Thu, 17 Jan 2013 09:16:37 -0200
Message-ID: <CAOMZO5DiK3qDE3+h+8ipJvAxWW3Eq4aNwmfWhMaL0mdPi=fbyA@mail.gmail.com>
Subject: Re: [PATCH] mtd: mxc_nand: compress ID info for send_read_id_v3
From: Fabio Estevam <festevam@gmail.com>
To: Roman Schneider <schneider@at.festo.com>
Content-Type: text/plain; charset=UTF-8
Cc: linux-mtd@lists.infradead.org, Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Roman,

On Tue, Jan 15, 2013 at 1:56 PM, Roman Schneider <schneider@at.festo.com> wrote:
> ---
>  Also compress the id in case of a v3 NAND flash controller (i.mx51, i.mx53)
>  and 16Bit buswidth.

This should go above the --- line.

You also missed a Signed-off-by line.
