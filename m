Received: from mail-gx0-f12.google.com ([209.85.217.12])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1KchZw-0002Ax-5E
	for linux-mtd@lists.infradead.org; Mon, 08 Sep 2008 14:19:01 +0000
Received: by gxk5 with SMTP id 5so7658521gxk.18
	for <linux-mtd@lists.infradead.org>;
	Mon, 08 Sep 2008 07:18:55 -0700 (PDT)
Date: Mon, 8 Sep 2008 10:17:54 -0400
From: Josh Boyer <jwboyer@gmail.com>
To: Artem Bityutskiy <dedekind@infradead.org>
Subject: Re: [PATCH 1/6] [MTD-UTILS] nandwrite: Qualifier Clean-up
Message-ID: <20080908141754.GA25728@yoda.jdub.homelinux.org>
References: <1220847899-22189-1-git-send-email-gerickson@nuovations.com>
	<1220851682.4036.48.camel@sauron>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1220851682.4036.48.camel@sauron>
Cc: linux-mtd@lists.infradead.org, Grant Erickson <gerickson@nuovations.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Sep 08, 2008 at 08:28:02AM +0300, Artem Bityutskiy wrote:
>On Sun, 2008-09-07 at 21:24 -0700, Grant Erickson wrote:
>> Static-qualified all globals except 'main' because they have no use
>> beyond file scope.
>> Constant-qualified MTD device and input positional parameter globals.
>> Constant-qualified argv array.
>
>Ack for whole series.

For my benefit, it would be nice if you put the full Acked-by: line in
future emails.  Then I don't have to go lookup what you typically use
for email address, etc in those cases :).

I'm going to assmue this is fine:

Acked-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>

Yell if it's not.

josh
