Received: from smtprelay0112.hostedemail.com ([216.40.44.112]
 helo=smtprelay.hostedemail.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Xe5LP-0001vH-Oa
 for linux-mtd@lists.infradead.org; Tue, 14 Oct 2014 16:53:08 +0000
Message-ID: <1413305557.3269.21.camel@joe-AO725>
Subject: Re: [PATCH 1/1 linux-next] fs/jffs2/nodelist.h: remove unnecessary
 __constant_ prefix
From: Joe Perches <joe@perches.com>
To: Fabian Frederick <fabf@skynet.be>
Date: Tue, 14 Oct 2014 09:52:37 -0700
In-Reply-To: <1413305085-7318-1-git-send-email-fabf@skynet.be>
References: <1413305085-7318-1-git-send-email-fabf@skynet.be>
Content-Type: text/plain; charset="ISO-8859-1"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, Andrew Morton <akpm@linux-foundation.org>,
 David Woodhouse <dwmw2@infradead.org>, linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2014-10-14 at 18:44 +0200, Fabian Frederick wrote:
> See commit fbdb8138cf0c
> ("checkpatch: warn on uses of __constant_<foo> functions")

Perhaps it'd be better to use the same
__builtin_constant_p test as swab.h and use
just one pattern instead

> diff --git a/fs/jffs2/nodelist.h b/fs/jffs2/nodelist.h
> index fa35ff7..9f0d547 100644
> --- a/fs/jffs2/nodelist.h
> +++ b/fs/jffs2/nodelist.h
> @@ -48,8 +48,8 @@
>  #define cpu_to_je32(x) ((jint32_t){cpu_to_be32(x)})
>  #define cpu_to_jemode(x) ((jmode_t){cpu_to_be32(os_to_jffs2_mode(x))})
>  
> -#define constant_cpu_to_je16(x) ((jint16_t){__constant_cpu_to_be16(x)})
> -#define constant_cpu_to_je32(x) ((jint32_t){__constant_cpu_to_be32(x)})
> +#define constant_cpu_to_je16(x) ((jint16_t){cpu_to_be16(x)})
> +#define constant_cpu_to_je32(x) ((jint32_t){cpu_to_be32(x)})

So none of these constant_<foo> things would be here
at all.
