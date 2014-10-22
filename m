Received: from smtp11.smtpout.orange.fr ([80.12.242.133]
 helo=smtp.smtpout.orange.fr)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Xh1kT-0002Fc-Gn
 for linux-mtd@lists.infradead.org; Wed, 22 Oct 2014 19:39:12 +0000
From: Robert Jarzmik <robert.jarzmik@free.fr>
To: Brian Norris <computersforpeace@gmail.com>
Subject: Re: [PATCH] mtd: docg3: fix 'defined but not used' warning
References: <1413998606-9589-1-git-send-email-computersforpeace@gmail.com>
 <CAN8TOE9yDA=v_v-48ZiG=5+Dk_JamxYxd_0jrWGtwQ5QXGrszA@mail.gmail.com>
Date: Wed, 22 Oct 2014 21:38:39 +0200
In-Reply-To: <CAN8TOE9yDA=v_v-48ZiG=5+Dk_JamxYxd_0jrWGtwQ5QXGrszA@mail.gmail.com>
 (Brian Norris's message of "Wed, 22 Oct 2014 10:33:28 -0700")
Message-ID: <87tx2vlwsg.fsf@free.fr>
MIME-Version: 1.0
Content-Type: text/plain
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Brian Norris <computersforpeace@gmail.com> writes:

> On Wed, Oct 22, 2014 at 10:23 AM, Brian Norris
> <computersforpeace@gmail.com> wrote:
>>    drivers/mtd/devices/docg3.c:2122:28: warning: 'docg3_dt_ids' defined but not used [-Wunused-variable]
>>     static struct of_device_id docg3_dt_ids[] = {
>
> I suppose I should add that this only happens when CONFIG_OF=n. I'll
> add this to the commit message if/when I apply this.

Thanks Brian, I had forgotten the non device-tree case, and overviewed the
warning. Your change is the way to go.

Cheers.

--
Robert
