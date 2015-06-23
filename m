Received: from smtp10.smtpout.orange.fr ([80.12.242.132]
 helo=smtp.smtpout.orange.fr)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Z7V3F-00029e-9t
 for linux-mtd@lists.infradead.org; Tue, 23 Jun 2015 20:44:14 +0000
From: Robert Jarzmik <robert.jarzmik@free.fr>
To: Richard Weinberger <richard@nod.at>
Subject: Re: [PATCH 6/6] mtd: docg3: Don't do ERR_PTR(0)
References: <1433193054-26865-1-git-send-email-richard@nod.at>
 <1433193054-26865-7-git-send-email-richard@nod.at>
 <20150617184144.GH4917@ld-irv-0074> <5588FC61.5070202@nod.at>
Date: Tue, 23 Jun 2015 22:41:33 +0200
In-Reply-To: <5588FC61.5070202@nod.at> (Richard Weinberger's message of "Tue,
 23 Jun 2015 08:27:45 +0200")
Message-ID: <871th2kvia.fsf@belgarion.home>
MIME-Version: 1.0
Content-Type: text/plain
Cc: dwmw2@infradead.org, Brian Norris <computersforpeace@gmail.com>,
 linux-mtd@lists.infradead.org, maximlevitsky@gmail.com,
 linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Richard Weinberger <richard@nod.at> writes:

> Am 17.06.2015 um 20:41 schrieb Brian Norris:
>> On Mon, Jun 01, 2015 at 11:10:54PM +0200, Richard Weinberger wrote:
>>> Don't return a obfuscated null pointer using ERR_PTR(0).
>>> If the no device is found clearly return -ENODEV.
>>> This makes the code more clear and matches the comment
>>> of doc_probe_device().
>>>
>>> Signed-off-by: Richard Weinberger <richard@nod.at>
>>> ---
>> 
>> Have you tested this patch?
>
> nah, I don't own such a device.
But I do. If you resend a patch, please Cc me. You can even ask for a test from
time to time if you want a confirmation, I have a 2 floors docg3 device.

Cheers.

--
Robert
