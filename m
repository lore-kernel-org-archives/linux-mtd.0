Received: from ug-out-1314.google.com ([66.249.92.171])
	by canuck.infradead.org with esmtp (Exim 4.62 #1 (Red Hat Linux))
	id 1G7FBF-0005SK-LD
	for linux-mtd@lists.infradead.org; Sun, 30 Jul 2006 13:34:26 -0400
Received: by ug-out-1314.google.com with SMTP id u40so427594ugc
	for <linux-mtd@lists.infradead.org>;
	Sun, 30 Jul 2006 10:34:15 -0700 (PDT)
Message-ID: <625fc13d0607301034i40bd9583na4c8c6fa2c0f4230@mail.gmail.com>
Date: Sun, 30 Jul 2006 12:34:15 -0500
From: "Josh Boyer" <jwboyer@gmail.com>
To: "Artem B. Bityutskiy" <dedekind@yandex.ru>
Subject: Re: question: the performance of jffs2 on UBI
In-Reply-To: <44C8C07D.2050909@yandex.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <49eab5c80607270530j469f2585w45fbe1d6449c2921@mail.gmail.com>
	<44C8BD55.3040604@yandex.ru> <44C8C07D.2050909@yandex.ru>
Cc: falls huang <falls.huang@gmail.com>, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 7/27/06, Artem B. Bityutskiy <dedekind@yandex.ru> wrote:
> The alternative way to is to create a good block device layer over UBI,
> and then use conventional file systems (N.B. the mtdblock driver is
> *not* a good block device layer).

Just a note, you lose compression if you do that.  AFAIK, jffs2 is the
only in-kernel filesystem that supports transparent read/write
compression.

josh
