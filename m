Received: from py-out-1112.google.com ([64.233.166.181])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1Jlpvq-00082Z-9V
	for linux-mtd@lists.infradead.org; Tue, 15 Apr 2008 18:31:02 +0000
Received: by py-out-1112.google.com with SMTP id a73so3224199pye.2
	for <linux-mtd@lists.infradead.org>;
	Tue, 15 Apr 2008 11:31:00 -0700 (PDT)
Message-ID: <f383264b0804151130h6dbc6a54wce4ec309f42ed114@mail.gmail.com>
Date: Tue, 15 Apr 2008 11:30:59 -0700
From: "Matt Reimer" <mattjreimer@gmail.com>
To: "Ben Dooks" <ben-mtd@fluff.org>
Subject: Re: S3C2410 NAND updates
In-Reply-To: <20080415103617.924928338@fluff.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
References: <20080415103617.924928338@fluff.org.uk>
Cc: Linux MTD <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Apr 15, 2008 at 3:36 AM, Ben Dooks <ben-mtd@fluff.org> wrote:
> These are some updates (and a fix) for the S3C2410
>  NAND controller, for merge after 2.6.25.

Ben,

If you have time, can you review the following patch? It has been
reported to work on s3c2410, s3c2412, and s3c2440, and has been acked
by J=F6rn Engel.

http://lists.infradead.org/pipermail/linux-mtd/2007-October/019586.html

Matt
