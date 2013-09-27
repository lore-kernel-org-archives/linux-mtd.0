Received: from b.ns.miles-group.at ([95.130.255.144] helo=radon.swed.at)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VPY6R-0003h4-Ni
 for linux-mtd@lists.infradead.org; Fri, 27 Sep 2013 13:29:04 +0000
Message-ID: <52458809.6050704@nod.at>
Date: Fri, 27 Sep 2013 15:28:41 +0200
From: Richard Weinberger <richard@nod.at>
MIME-Version: 1.0
To: Richard Genoud <richard.genoud@gmail.com>
Subject: Re: [PATCH] UBI: simplify image sequence test
References: <1380286316-29911-1-git-send-email-richard.genoud@gmail.com>
 <1380286316-29911-2-git-send-email-richard.genoud@gmail.com>
In-Reply-To: <1380286316-29911-2-git-send-email-richard.genoud@gmail.com>
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: 7bit
Cc: linux-mtd <linux-mtd@lists.infradead.org>,
 David Woodhouse <dwmw2@infradead.org>, linux-kernel@vger.kernel.org,
 Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Am 27.09.2013 14:51, schrieb Richard Genoud:
> The test:
> if (!a && b)
>   a = b;
> can be symplified in:
> if (!a)
>   a = b;
> 
> And there's no need to test if ubi->image_seq is not null, because if it is,
> it is set to image_seq.
> So, we just test if image_seq is not null.
> 
> Signed-off-by: Richard Genoud <richard.genoud@gmail.com>

Acked-by: Richard Weinberger <richard@nod.at>
