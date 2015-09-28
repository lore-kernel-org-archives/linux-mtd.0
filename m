Received: from smtp04.smtpout.orange.fr ([80.12.242.126]
 helo=smtp.smtpout.orange.fr)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZgTHT-0005R8-UB
 for linux-mtd@lists.infradead.org; Mon, 28 Sep 2015 07:55:28 +0000
From: Robert Jarzmik <robert.jarzmik@free.fr>
To: Brian Norris <computersforpeace@gmail.com>
Cc: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>,
 David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] mtd: nand: pxa3xx-nand: prevent DFI bus lockup on
 removal
References: <1440961710-17347-1-git-send-email-robert.jarzmik@free.fr>
 <87a8s9exxg.fsf@belgarion.home> <20150928000515.GA34421@google.com>
Date: Mon, 28 Sep 2015 09:50:00 +0200
In-Reply-To: <20150928000515.GA34421@google.com> (Brian Norris's message of
 "Sun, 27 Sep 2015 17:05:15 -0700")
Message-ID: <87twqfdluf.fsf@belgarion.home>
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

> On Sat, Sep 26, 2015 at 10:19:07PM +0200, Robert Jarzmik wrote:
>> Robert Jarzmik <robert.jarzmik@free.fr> writes:
>> 
>> > After the conversion of pxa architecture to common clock framework, the
>> > NAND clock can be disabled on driver exit.
>> >
>> > In this case, it happens that if the driver used the NAND and set the
>> > DFI arbitration bit, the next access to a static memory controller area,
>> > such as an ethernet card, will stall the system bus, and the core will
>> > be stalled forever.
>> >
>> > This is especially true on pxa31x SoCs, where the NDCR was augmented
>> > with a new bit to prevent this lockups by giving full ownership of the
>> > DFI arbiter to the SMC, in change SCr#6.
>> >
>> > Fix this by clearing the DFI arbritration bit in driver exit. This
>> > effectively prevents a lockup on zylonite when removing pxa3xx-nand
>> > module, and using ethernet afterwards.
>> >
>> > Signed-off-by: Robert Jarzmik <robert.jarzmik@free.fr>
>> Hi Brian,
>> 
>> Are you happy with this patch, and if so could you queue it please ?
>
> It looks OK to me, but it doesn't apply to the latest l2-mtd.git. Am I
> missing something? I didn't try too hard to work out the conflict
> myself.
OK, I'll rebase it on your tree and resend a "PATCH v2 REBASED" version today.

Cheers.

-- 
Robert
