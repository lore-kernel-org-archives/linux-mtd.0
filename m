Received: from mail-pd0-x22b.google.com ([2607:f8b0:400e:c02::22b])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZTuSf-0002pL-9j
 for linux-mtd@lists.infradead.org; Mon, 24 Aug 2015 16:19:05 +0000
Received: by pdbmi9 with SMTP id mi9so55054227pdb.3
 for <linux-mtd@lists.infradead.org>; Mon, 24 Aug 2015 09:18:43 -0700 (PDT)
Date: Mon, 24 Aug 2015 09:18:37 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Artem Bityutskiy <dedekind1@gmail.com>
Cc: Richard Weinberger <richard@nod.at>,
 Dongsheng Yang <yangds.fnst@cn.fujitsu.com>,
 linux-mtd@lists.infradead.org, linux-fsdevel@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] ubifs: Allow O_DIRECT
Message-ID: <20150824161837.GA28975@localhost>
References: <1440016553-26481-1-git-send-email-richard@nod.at>
 <1440016553-26481-2-git-send-email-richard@nod.at>
 <55D542C5.6040500@cn.fujitsu.com>
 <1440070300.31419.202.camel@gmail.com> <55D5BC92.8050903@nod.at>
 <20150820204933.GG74600@google.com>
 <1440400405.15510.29.camel@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1440400405.15510.29.camel@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Aug 24, 2015 at 10:13:25AM +0300, Artem Bityutskiy wrote:
> Now, some user-space fails when direct I/O is not supported.

I think the whole argument rested on what it means when "some user space
fails"; apparently that "user space" is just a test suite (which
can/should be fixed).

> We can
> chose to fake direct I/O or fix user-space. The latter seems to be the
> preferred course of actions, and you are correctly pointing the man
> page.
> 
> However, if
> 
> 1. we are the only FS erroring out on O_DIRECT
> 2. other file-systems not supporting direct IO just fake it
> 
> we may just follow the crowd and fake it too.
> 
> I am kind of trusting Richard here - I assume he did the research and
> the above is the case, this is why I am fine with his patch.
> 
> Does this logic seem acceptable to you? Other folk's opinion would be
> great to hear.

Could work for me, though that doesn't seem ideal. Anyway, it now seems
Christopher and Richard agree with me.

Regards,
Brian
