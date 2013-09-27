Received: from b.ns.miles-group.at ([95.130.255.144] helo=radon.swed.at)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VPXne-0002kU-F6
 for linux-mtd@lists.infradead.org; Fri, 27 Sep 2013 13:09:44 +0000
Message-ID: <52458377.7040100@nod.at>
Date: Fri, 27 Sep 2013 15:09:11 +0200
From: Richard Weinberger <richard@nod.at>
MIME-Version: 1.0
To: Richard Genoud <richard.genoud@gmail.com>
Subject: Re: [PATCH] UBI: fastmap: fix backward compatibility with image_seq
References: <1380286316-29911-1-git-send-email-richard.genoud@gmail.com>
In-Reply-To: <1380286316-29911-1-git-send-email-richard.genoud@gmail.com>
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
> Some old UBI implementations (e.g. U-Boot) have not implemented the image
> sequence feature.
> So, when erase blocks are written, the image sequence in the ec header
> is lost (set to zero).
> UBI scan_all() takes this case into account (commits
> 32bc4820287a1a03982979515949e8ea56eac641 and
> 2eadaad67b2b6bd132eda105128d2d466298b8e3)
> 
> But fastmap scan functions (ubi_scan_fastmap() and scan_pool()) didn't.
> 
> This patch fixes the issue.
> 
> Signed-off-by: Richard Genoud <richard.genoud@gmail.com>
> ---

W00t! Good catch!

Acked-by: Richard Weinberger <richard@nod.at>
