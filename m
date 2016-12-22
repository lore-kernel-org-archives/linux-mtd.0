Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.85_2 #1 (Red Hat Linux))
 id 1cJzXA-0005lZ-8L
 for linux-mtd@lists.infradead.org; Thu, 22 Dec 2016 09:19:33 +0000
Date: Thu, 22 Dec 2016 10:19:09 +0100
From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
To: David Oberhollenzer <david.oberhollenzer@sigma-star.at>
Cc: linux-mtd@lists.infradead.org, richard@sigma-star.at
Subject: Re: [PATCH] mtd-utils: Add configure switches to disable jffsX or
 ubifs tools
Message-ID: <20161222101909.3a386438@free-electrons.com>
In-Reply-To: <20161221155412.29706-1-david.oberhollenzer@sigma-star.at>
References: <20161221155412.29706-1-david.oberhollenzer@sigma-star.at>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello,

On Wed, 21 Dec 2016 16:54:12 +0100, David Oberhollenzer wrote:

> +AC_ARG_WITH([jffs],
> +	[AS_HELP_STRING([--without-jffs], [Disable jffsX utilities])],
> +	[case "${withval}" in
> +	yes) AM_CONDITIONAL([BUILD_JFFSX], [true]) ;;
> +	no)  AM_CONDITIONAL([BUILD_JFFSX], [false]) ;;
> +	*) AC_MSG_ERROR([bad value ${withval} for --without-jffs]) ;;
> +	esac],
> +	[AM_CONDITIONAL([BUILD_JFFSX], [true])])
> +
> +AC_ARG_WITH([ubifs],
> +	[AS_HELP_STRING([--without-ubifs], [Disable ubifs utilities])],
> +	[case "${withval}" in
> +	yes) AM_CONDITIONAL([BUILD_UBIFS], [true]) ;;
> +	no)  AM_CONDITIONAL([BUILD_UBIFS], [false]) ;;
> +	*) AC_MSG_ERROR([bad value ${withval} for --without-ubifs]) ;;
> +	esac],
> +	[AM_CONDITIONAL([BUILD_UBIFS], [true])])

If the only two correct values are "yes" or "no", then you should use
AC_ARG_ENABLE() and not AC_ARG_WITH().

Also, I believe a much more autoconf-ish way of writing this is:

AC_ARG_ENABLE([jffs],
	[AS_HELP_STRING([--without-jffs], [Disable jffsX utilities])],
	[], [enable_jffs=yes])

if "${enable_jffs}" = "yes" ; then
	need_uuid="yes"
	need_zlib="yes"
	need_lzo="yes"
fi

Indeed, using AM_CONDITIONAL() is useful to assign automake variable.
Here, BUILD_JFFS and BUILD_UBIFS are apparently only used within the
configure.ac, so using AM_CONDITIONAL() is useless.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
