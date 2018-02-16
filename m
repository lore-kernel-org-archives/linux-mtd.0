Received: from mail-pl0-x241.google.com ([2607:f8b0:400e:c01::241])
 by bombadil.infradead.org with esmtps (Exim 4.89 #1 (Red Hat Linux))
 id 1emjlq-0001Jm-R5
 for linux-mtd@lists.infradead.org; Fri, 16 Feb 2018 17:26:04 +0000
Received: by mail-pl0-x241.google.com with SMTP id h10so2020286plt.5
 for <linux-mtd@lists.infradead.org>; Fri, 16 Feb 2018 09:25:52 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <CAAEAJfD6CbWOfrYOY4QDW0tte-yOebcZTGjUDQhR8uE+fsOs3w@mail.gmail.com>
References: <cover.1518797480.git.shreeya.patel23498@gmail.com>
 <1963507.Bpu1nn9g4S@blindfold>
 <CAAEAJfD6CbWOfrYOY4QDW0tte-yOebcZTGjUDQhR8uE+fsOs3w@mail.gmail.com>
From: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Date: Fri, 16 Feb 2018 14:25:51 -0300
Message-ID: <CAAEAJfDpHotBRB4u0kfuOAM2cwaLqJFkYEsLHeozOGsSu_27cw@mail.gmail.com>
Subject: Re: [PATCH NAND 0/5] Replace printk statements with pr_*macros
To: Richard Weinberger <richard@nod.at>
Cc: Shreeya Patel <shreeya.patel23498@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>, Marek Vasut <marek.vasut@gmail.com>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>,
 outreachy-kernel <outreachy-kernel@googlegroups.com>,
 linux-mtd@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

(Ccing MTD)

On 16 February 2018 at 14:24, Ezequiel Garcia
<ezequiel@vanguardiasur.com.ar> wrote:
> Hey Richard,
>
> On 16 February 2018 at 14:19, Richard Weinberger <richard@nod.at> wrote:
>> Am Freitag, 16. Februar 2018, 17:50:09 CET schrieb Shreeya Patel:
>>> This patchset removes all the log levels i.e. KERN_WARN,
>>> KERN_NOTICE, KERN_ERR, KERN_INFO, KERN_DEBUG used in the printk
>>> statements and replaces the printk statements with appropriate
>>> pr_*macros.
>>> According to the kernel coding style, pr_*macro is the preferred
>>> way to print the message.
>>
>> Beside of that, how does it improve the code?
>> Don't get me wrong, pr_* is the way to go for new code, but I don't thin=
k it
>> is worth "fixing" in existing code and make working with git blame more
>> painful.
>>
>
> Shreeya's intention is to work on [1], migrating drivers to exec_op.
> As a first task, before being accepted, she is required to submit
> cleanup patches (or small tasks).
>
> Since I couldn't come up with small tasks for MTD, I suggested
> starting with printk cleaning. So this was my idea.
>
> Printk to pr_{} or dev_{} is not only aesthetical, it's also a consolidat=
ion
> change. Centralizing prints allows for other improvements.
>
> See for instance Wolfram's work [2, 3].
>
> In any case, does it hurt git-blame so much? It only affects
> the lines where the print is performed.
>
> BTW, should you have ideas for small cleanup tasks in MTD,
> let us know.
>
> [1] https://www.outreachy.org/communities/cfp/linux-kernel/project/migrat=
e-nand-driver-to-new-exec_op-framework/
> [2] https://elinux.org/Refactor_kernel_strings
> [3] https://elinux.org/Refactor_kernel_strings
>
> Thanks,
> --
> Ezequiel Garc=C3=ADa, VanguardiaSur
> www.vanguardiasur.com.ar



--=20
Ezequiel Garc=C3=ADa, VanguardiaSur
www.vanguardiasur.com.ar
