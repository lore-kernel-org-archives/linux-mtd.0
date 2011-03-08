Received: from mail-ww0-f49.google.com ([74.125.82.49])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1PwwBN-00025q-Rv
	for linux-mtd@lists.infradead.org; Tue, 08 Mar 2011 12:38:34 +0000
Received: by wwc33 with SMTP id 33so685314wwc.18
	for <linux-mtd@lists.infradead.org>;
	Tue, 08 Mar 2011 04:38:32 -0800 (PST)
Subject: Re: [PATCH/RFC v2 1/3] Shared BCH ECC library
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Ivan Djelic <ivan.djelic@parrot.com>
In-Reply-To: <181c9a1c88b781116615761109cccdf89ea877a1.2296641159.git.ivan.djelic@parrot.com>
References: <181c9a1c88b781116615761109cccdf89ea877a1.2296641159.git.ivan.djelic@parrot.com>
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 08 Mar 2011 14:37:05 +0200
Message-ID: <1299587825.2754.30.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Andrew Morton <akpm@linux-foundation.org>, linux-mtd@lists.infradead.org,
	linux-kernel <linux-kernel@vger.kernel.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Well, I can put these to my l2-mtd-2.6 tree and l
On Mon, 2011-02-07 at 15:09 +0100, Ivan Djelic wrote:
>  #
> +# BCH support is selected if needed
> +#
> +# If the BCH library is always used with the same parameters
> +# m and t, you may select option BCH_CONST_PARAMS and provide
> +# default values for symbols BCH_CONST_M and BCH_CONST_T in
> +# your Kconfig code. This will enable extra compiler optimizations
> +# and provide better (up to 2x) encoding performance for small
> +# values of t, at the expense of supporting only a single (m,t)
> +# configuration.
> +#
> +config BCH
> +	tristate
> +
> +config BCH_CONST_PARAMS
> +	boolean
> +
> +config BCH_CONST_M
> +	int
> +	range 5 15
> +
> +config BCH_CONST_T
> +	int

Could you please re-work this and add useful "help" description to each
of these. You added some description to the comments, but it really
should be in the help text instead, may be even in a bit more verbose
form.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
