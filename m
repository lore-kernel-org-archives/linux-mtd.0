Received: from smtp1-g21.free.fr ([2a01:e0c:1:1599::10])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1RUbzS-0005Lt-0f
 for linux-mtd@lists.infradead.org; Sun, 27 Nov 2011 10:29:43 +0000
From: Robert Jarzmik <robert.jarzmik@free.fr>
To: Greg KH <greg@kroah.com>
Subject: Re: [PATCH v3 16/16] mtd/docg3: add protection areas sysfs access
References: <1321714978-24543-1-git-send-email-robert.jarzmik@free.fr>
 <1321714978-24543-17-git-send-email-robert.jarzmik@free.fr>
 <20111126235727.GA12856@kroah.com>
Date: Sun, 27 Nov 2011 11:29:28 +0100
In-Reply-To: <20111126235727.GA12856@kroah.com> (Greg KH's message of "Sat, 26
 Nov 2011 15:57:27 -0800")
Message-ID: <87r50t3lkn.fsf@free.fr>
MIME-Version: 1.0
Content-Type: text/plain
Cc: linux-mtd@lists.infradead.org, dwmw2@infradead.org,
 linux-kernel@vger.kernel.org, dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Greg KH <greg@kroah.com> writes:

> On Sat, Nov 19, 2011 at 04:02:58PM +0100, Robert Jarzmik wrote:
>> As each docg3 chip has 2 protection areas (DPS0 and DPS1),
>> and because theses areas can prevent user access to the chip
>> data, add for each floor the sysfs entries which insert the
>> protection key into the right DPS.
>> 
>> Signed-off-by: Robert Jarzmik <robert.jarzmik@free.fr>
>
> As you are adding new sysfs files, you also must add Documentation/ABI
> entries for them.  Please do so.
OK Greg, I'll prepare a patch soon.

Cheers.

-- 
Robert
