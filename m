Received: from nz-out-0102.google.com ([64.233.162.207])
	by canuck.infradead.org with esmtp (Exim 4.62 #1 (Red Hat Linux))
	id 1FfjJD-0007Y0-34
	for linux-mtd@lists.infradead.org; Mon, 15 May 2006 16:04:55 -0400
Received: by nz-out-0102.google.com with SMTP id o1so253034nzf
	for <linux-mtd@lists.infradead.org>;
	Mon, 15 May 2006 13:04:48 -0700 (PDT)
Message-ID: <c384c5ea0605151304h66ebfael77a3079326fe5937@mail.gmail.com>
Date: Mon, 15 May 2006 22:04:47 +0200
From: "Leon Woestenberg" <leon.woestenberg@gmail.com>
To: "David Woodhouse" <dwmw2@infradead.org>
In-Reply-To: <c384c5ea0605130623kbe33713n25c28669022d94e1@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
References: <c384c5ea0605110820m606a04e7nc87cbc9302fd619c@mail.gmail.com>
	<44635DD6.10805@arcom.com>
	<1147519362.32310.21.camel@pmac.infradead.org>
	<c384c5ea0605130623kbe33713n25c28669022d94e1@mail.gmail.com>
Cc: linux-mtd@lists.infradead.org
Subject: Re: [PATCH] Do not oops when configured flash size is less then
	chip size
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello David,

On 5/13/06, Leon Woestenberg <leon.woestenberg@gmail.com> wrote:
> Hello David W, David V et al,
>
> On 5/13/06, David Woodhouse <dwmw2@infradead.org> wrote:
> > Please could you test this for me?
> The right code paths seem to be taken, and it solves the issue. See
> the 'too small' boot (that oopsed earlier) below.
>
> I had to change the last formatter in printk from %d to %lu to prevent
> a compiler warning:
>
I am curious if this made it into your MTD GIT tree, so I can flag
this issue as being "streamed up for mainline"? :-)

Regards, thanks,

Leon.
