Received: from mga14.intel.com ([192.55.52.115])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XYDAp-00070W-Cp
 for linux-mtd@lists.infradead.org; Sun, 28 Sep 2014 12:01:55 +0000
Message-ID: <1411905665.11836.15.camel@karhu>
Subject: Re: [PATCH] mtd: ubi: Extend UBI layer debug/messaging capabilities
From: Artem Bityutskiy <dedekind1@gmail.com>
Reply-To: dedekind1@gmail.com
To: Tanya Brokhman <tlinder@codeaurora.org>
Date: Sun, 28 Sep 2014 15:01:05 +0300
In-Reply-To: <1411886185-7838-1-git-send-email-tlinder@codeaurora.org>
References: <1411886185-7838-1-git-send-email-tlinder@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-arm-msm@vger.kernel.org, open list <linux-kernel@vger.kernel.org>,
 dedeking1@gmail.com, linux-mtd@lists.infradead.org,
 Richard Weinberger <richard@nod.at>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sun, 2014-09-28 at 09:36 +0300, Tanya Brokhman wrote:
> If there is more then one UBI device mounted, there is no way to
> distinguish between messages from different UBI devices.
> Add device number to all ubi layer message types.

Hi, the goal looks legit to me, but the patch is so large that I do not
think that I can really review it in this form.

a) A patch which changes the macros (ubi_err(), etc)
b) A set of patches which do not change messages at all, but add the
'ubi' parameter to the places where it is missing.
c) A patch which changes the messages.

So a) will be the most important patch for the reviewer. b) - more or
less mechanical changes of a similar kind. c) - the same.

Also, if you add a parameter to 'ubi_err()' and the other printing
wrappers, add 'ubi' there, not 'ubi_num'. This will allow to prefix
messages with vary different things, not just the device number in the
future. So the calls would look like

ubi_err(ubi, "inconsistent used_ebs");

Once this is done, the series should be more reviewable. The next thing
I'd check is whether we really need to change all the messages, or most
of them, or we actually need to change only a small part of them. In the
former case, it is OK to do what you do, I guess. In the latter case we
probably better off with introducing a separate set of printing macros
and leave the existing ones as they are.

Thanks!

-- 
Best Regards,
Artem Bityutskiy
