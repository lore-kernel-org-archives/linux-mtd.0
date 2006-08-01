Received: from ug-out-1314.google.com ([66.249.92.173])
	by canuck.infradead.org with esmtp (Exim 4.62 #1 (Red Hat Linux))
	id 1G7iSV-0000b4-O7
	for linux-mtd@lists.infradead.org; Mon, 31 Jul 2006 20:50:13 -0400
Received: by ug-out-1314.google.com with SMTP id u40so1098280ugc
	for <linux-mtd@lists.infradead.org>;
	Mon, 31 Jul 2006 17:50:06 -0700 (PDT)
Message-ID: <625fc13d0607311750t4537d54ai69273a4b0101affc@mail.gmail.com>
Date: Mon, 31 Jul 2006 19:50:00 -0500
From: "Josh Boyer" <jwboyer@gmail.com>
To: dbyron@hheld.com
Subject: Re: autoconf for mtd-utils
In-Reply-To: <002301c6b4c9$5aa3d3b0$a134800a@RudiDell>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <002301c6b4c9$5aa3d3b0$a134800a@RudiDell>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 7/31/06, David Byron <dbyron@hheld.com> wrote:
> On Sun, 2006-07-30 at 11:10a, Josh Boyer wrote:
>
> > Something like that.  But leave the definition of CROSS alone.  It's
> > better to leave the trailing '-' at the end so that if other cross
> > tools are needed, you just specify $(CROSS)ld, etc.
>
> How's this?

Better.  But it only defines BUILDDIR during a cross compile.  Is that
what you wanted?  Or did you want a general purpose way to separate
the object and binary files from the source during build time?

Sorry for not asking that question sooner.  I've just gotten back from
vacation so I'm a bit slow to respond on some things.

josh
