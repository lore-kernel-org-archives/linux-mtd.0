Received: from mail-pa0-x236.google.com ([2607:f8b0:400e:c03::236])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZwED9-00012P-3v
 for linux-mtd@lists.infradead.org; Tue, 10 Nov 2015 19:04:07 +0000
Received: by pabfh17 with SMTP id fh17so5158756pab.0
 for <linux-mtd@lists.infradead.org>; Tue, 10 Nov 2015 11:03:46 -0800 (PST)
Date: Tue, 10 Nov 2015 11:03:43 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Joe Perches <joe@perches.com>
Cc: Saurabh Sengar <saurabh.truth@gmail.com>, andy.shevchenko@gmail.com,
 joern@lazybastard.org, dwmw2@infradead.org,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mtd: phram: error handling
Message-ID: <20151110190343.GR12143@google.com>
References: <CAHp75VeUie1VdWUgXfFD6XqU5t_9j-40papME3-8MUvjMh1iMw@mail.gmail.com>
 <1447050198-20562-1-git-send-email-saurabh.truth@gmail.com>
 <20151110182047.GP12143@google.com>
 <1447180387.2701.68.camel@perches.com>
 <20151110183956.GQ12143@google.com>
 <1447181155.2701.72.camel@perches.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1447181155.2701.72.camel@perches.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Nov 10, 2015 at 10:45:55AM -0800, Joe Perches wrote:
> On Tue, 2015-11-10 at 10:39 -0800, Brian Norris wrote:
> > On Tue, Nov 10, 2015 at 10:33:07AM -0800, Joe Perches wrote:
> > > Expand parse_err macro with hidden flow in-place.
> > > Remove the now unused parse_err macro.
> []
> > I think -EINVAL makes more sense than 1. That
> > could be a subsequent patch, I suppose.
> 
> That means you have to trace all the callers
> to verify that converting 1 to -22 is acceptable.

It's fairly simple. Module initialization and module parameter calls
both *should* follow 0/negative error conventions. For module init, see
in kernel/module.c:

        /* Start the module */
        if (mod->init != NULL)
                ret = do_one_initcall(mod->init);
        if (ret < 0) {
                goto fail_free_freeinit;
        }
        if (ret > 0) {
                pr_warn("%s: '%s'->init suspiciously returned %d, it should "
                        "follow 0/-E convention\n"
                        "%s: loading module anyway...\n",
                        __func__, mod->name, ret, __func__);
                dump_stack();
        }

and in include/linux/moduleparam.h:

struct kernel_param_ops {
...
        /* Returns 0, or -errno.  arg is in kp->arg. */
        int (*set)(const char *val, const struct kernel_param *kp);
...
};

And for built-in modules, the return code is ignored (see
do_initcall_level()).

So I think the only question is whether we should actually be reporting
these errors on module insertion and on the module parameter call. I'd
say "definitely" to the latter and "yes" to the former, since the init
function already handles the case of an empty input (so the module can
be loaded with a blank command line without tripping on an -EINVAL
parameter check).

IOW, to use -EINVAL would be to actually enforce the error handling that
was intended in the first place. But that should be done in a separate
patch, and with an actual tester (since I doubt either you or Saurabh
are testing this driver).

Brian
