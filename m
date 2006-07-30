Received: from ug-out-1314.google.com ([66.249.92.174])
	by canuck.infradead.org with esmtp (Exim 4.62 #1 (Red Hat Linux))
	id 1G7Fjf-0005uH-QL
	for linux-mtd@lists.infradead.org; Sun, 30 Jul 2006 14:10:01 -0400
Received: by ug-out-1314.google.com with SMTP id u40so435415ugc
	for <linux-mtd@lists.infradead.org>;
	Sun, 30 Jul 2006 11:09:52 -0700 (PDT)
Message-ID: <625fc13d0607301109k43537c7xfe045d288c018fe0@mail.gmail.com>
Date: Sun, 30 Jul 2006 13:09:51 -0500
From: "Josh Boyer" <jwboyer@gmail.com>
To: dbyron@hheld.com
Subject: Re: autoconf for mtd-utils
In-Reply-To: <000c01c6ab7b$9aa01f70$a134800a@RudiDell>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <000c01c6ab7b$9aa01f70$a134800a@RudiDell>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 7/19/06, David Byron <dbyron@hheld.com> wrote:
> On Wed, 2006-07-19 at 12:25p, David Woodhouse wrote:
>
> > If you just send a proper Makefile patch which provides
> > separate source and build directories, that'd be useful
> > though.
>
> Like this?

Something like that.  But leave the definition of CROSS alone.  It's
better to leave the trailing '-' at the end so that if other cross
tools are needed, you just specify $(CROSS)ld, etc.

josh
