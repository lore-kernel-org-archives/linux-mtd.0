Received: from smtp.nokia.com ([131.228.20.170] helo=mgw-ext11.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1IEllo-0004Pv-0a
	for linux-mtd@lists.infradead.org; Sat, 28 Jul 2007 08:51:46 -0400
Subject: Re: [PATCH 1/5] ubi-utils: introduction of libubi_common
From: Artem Bityutskiy <dedekind@infradead.org>
To: Alexander Schmidt <alexs@linux.vnet.ibm.com>
In-Reply-To: <200707271728.48560.alexs@linux.vnet.ibm.com>
References: <200707271723.38987.alexs@linux.vnet.ibm.com>
	<200707271728.48560.alexs@linux.vnet.ibm.com>
Content-Type: text/plain; charset=utf-8
Date: Sat, 28 Jul 2007 15:51:30 +0300
Message-Id: <1185627090.26902.18.camel@sauron>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	Andreas Arnez <arnez@linux.vnet.ibm.com>,
	Frank Haverkamp <haver@linux.vnet.ibm.com>
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2007-07-27 at 17:28 +0200, Alexander Schmidt wrote:
> +#include <stdio.h>
> +#include <unistd.h>
> +#include <errno.h>
> +#include <sys/stat.h>
> +#include <fcntl.h>
> +
> +#define DEFAULT_DEV_PATTERN    "/dev/ubi%d"
> +#define DEFAULT_VOL_PATTERN    "/dev/ubi%d_%d"

Is it possible to make any patterns like this part of _utilities_?
UBI devices may have any names and it is defined by udev. The
library should not assume any UBI device name.

Whole this file should be out of libubi,not part of it.

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
