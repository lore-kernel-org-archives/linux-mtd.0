Received: from smtp05.smtpout.orange.fr ([80.12.242.127]
 helo=smtp.smtpout.orange.fr)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aAGUJ-0002wQ-Vr
 for linux-mtd@lists.infradead.org; Sat, 19 Dec 2015 12:19:52 +0000
From: Robert Jarzmik <robert.jarzmik@free.fr>
To: Brian Norris <computersforpeace@gmail.com>
Cc: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 Ezequiel Garcia <ezequiel.garcia@free-electrons.com>,
 David Woodhouse <dwmw2@infradead.org>,
 "linux-mtd\@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "linux-kernel\@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/3] mtd: nand: pxa3xx_nand: add register access debug
References: <1439323034-8820-1-git-send-email-robert.jarzmik@free.fr>
 <20150818042426.GA27858@laptop> <874mjwa1w6.fsf@belgarion.home>
 <87r3mt3jpw.fsf@belgarion.home>
 <CAAEAJfD2NB+JkpwwcwRz6gWOfcNVEY2MqWGkCskf0a0WRNR9gQ@mail.gmail.com>
 <20151219004845.GW10460@google.com>
Date: Sat, 19 Dec 2015 13:19:26 +0100
In-Reply-To: <20151219004845.GW10460@google.com> (Brian Norris's message of
 "Fri, 18 Dec 2015 16:48:45 -0800")
Message-ID: <87lh8qhbqp.fsf@belgarion.home>
MIME-Version: 1.0
Content-Type: text/plain
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Brian Norris <computersforpeace@gmail.com> writes:

> I don't have very strong opinions on this. It's kind of annoying to have
> this sort of stuff duplicated for every driver, if it's really needed.
> But I'll admit this kind of infrastructure is sometimes useful.
>
> Anecdote: I recently found the regmap trace event infrastructure pretty
> nice for debugging some other drivers. This would only require you to
> have tracing enabled, and then no recompiles are necessary at all. Just
> cmdline changes.
>
> So, I could go with this patch, if Robert still desires it. Or you could
> convert to using regmap for MMIO :)
I'm as you, I don't feel strong opinion about it, I'd like to have a debug
tracing tool, be that this patch or regmap MMIO.

If we all agree on a path I could even make the final patch, whichever solution
is chosen.

Cheers.

-- 
Robert
