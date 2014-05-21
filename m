Received: from top.free-electrons.com ([176.31.233.9]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Wn9GP-0001jk-NV
 for linux-mtd@lists.infradead.org; Wed, 21 May 2014 16:21:10 +0000
Date: Wed, 21 May 2014 13:20:11 -0300
From: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
To: linux-mtd@lists.infradead.org, Artem Bityutskiy <dedekind1@gmail.com>
Subject: Re: [PATCH v2 for v3.15 0/3] UBI: block: Support very large volumes
Message-ID: <20140521162011.GA2583@arch.cereza>
References: <1399284714-6283-1-git-send-email-ezequiel.garcia@free-electrons.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1399284714-6283-1-git-send-email-ezequiel.garcia@free-electrons.com>
Cc: Richard Weinberger <richard@nod.at>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Artem,

On 05 May 07:11 AM, Ezequiel Garcia wrote:
> Changes from v1:
> 
>   * Fixed ubiblock_resize so it returns something. I've kept a ubi_warn
>     message in ubiblock_resize, because otherwise the failure is not reported
>     to the user in any way.
>     Thanks for the kbuild-robot for reporting this!
> 

Gentle reminder :)

-- 
Ezequiel García, Free Electrons
Embedded Linux, Kernel and Android Engineering
http://free-electrons.com
