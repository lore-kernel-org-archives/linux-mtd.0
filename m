Received: from mga11.intel.com ([192.55.52.93])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XmIHl-0006vk-5h
 for linux-mtd@lists.infradead.org; Thu, 06 Nov 2014 08:19:17 +0000
Message-ID: <1415261925.958.177.camel@sauron.fi.intel.com>
Subject: Re: [PATCH V5] mtd: ubi: Extend UBI layer debug/messaging capabilities
From: Artem Bityutskiy <dedekind1@gmail.com>
Reply-To: dedekind1@gmail.com
To: Tanya Brokhman <tlinder@codeaurora.org>
Date: Thu, 06 Nov 2014 10:18:45 +0200
In-Reply-To: <54566692.10504@codeaurora.org>
References: <1413824221-31235-1-git-send-email-tlinder@codeaurora.org>
 <5449C870.7060509@huawei.com> <54566692.10504@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: Richard Weinberger <richard@nod.at>,
 open list <linux-kernel@vger.kernel.org>, hujianyang <hujianyang@huawei.com>,
 linux-mtd@lists.infradead.org, ezequiel.garcia@free-electrons.com,
 linux-arm-msm@vger.kernel.org, Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sun, 2014-11-02 at 19:14 +0200, Tanya Brokhman wrote:
> >> +    ubi_err(ubi, "self-check failed for PEB %d", pnum);
> >> +    ubi_msg(ubi, "hex dump of the %d-%d region",
> >> +             offset, offset + len);
> >>      print_hex_dump(KERN_DEBUG, "", DUMP_PREFIX_OFFSET, 32, 1, buf,
> len, 1);
> >>      err = -EINVAL;
> >>   error:
> >
> > Artem, I know you have tried to align the message code in different
> lines, maybe
> > you can check if you lose this one.
> >
> 
> hmmm... not sure I understand what is wrong here....

It is more of a nit-pick, but we try to be consistent. Here is how we
align split messages:

  ubi_msg(ubi, "blah",
          XYZ)

and not

  ubi_msg(ubi, "blah",
            XYZ)

So we first use few tabs, and then some spaces to align. You use just
tabs. Sometimes the second line is aligned, sometimes it goes a bit
further.
