Received: from mail-fx0-f49.google.com ([209.85.161.49])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QUO2O-0002fT-EM
	for linux-mtd@lists.infradead.org; Wed, 08 Jun 2011 19:03:33 +0000
Received: by fxm14 with SMTP id 14so744617fxm.36
	for <linux-mtd@lists.infradead.org>;
	Wed, 08 Jun 2011 12:03:30 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <BANLkTi=7Xivud_V=uMadL1BA-1ZC7V9RYw@mail.gmail.com>
References: <1307487717-25402-1-git-send-email-computersforpeace@gmail.com>
	<1307487717-25402-5-git-send-email-computersforpeace@gmail.com>
	<1307544476.31223.119.camel@localhost>
	<BANLkTi=7Xivud_V=uMadL1BA-1ZC7V9RYw@mail.gmail.com>
From: Mike Frysinger <vapier.adi@gmail.com>
Date: Wed, 8 Jun 2011 15:03:10 -0400
Message-ID: <BANLkTinFZL-ybdZxqdDthEZLAmXtKCCCSA@mail.gmail.com>
Subject: Re: [PATCH 4/4] mtd: nand: define pr_fmt() to include __func__ in
	debug output
To: Brian Norris <computersforpeace@gmail.com>
Content-Type: text/plain; charset=UTF-8
Cc: linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>,
	Igor Grinberg <grinberg@compulab.co.il>, dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Jun 8, 2011 at 14:23, Brian Norris wrote:
> On Wed, Jun 8, 2011 at 7:47 AM, Artem Bityutskiy wrote:
>> Compare:
>>
>> read_bbt: Error reading bad block table
>> read_bbt: error reading bad block table
>>
>> isn't the second version more correct? Or this depends on the country? I
>> prefer the latter, but as long as all messages are consistent, I do not
>> care much. What do you think?
>
> I'm not sure it's not so much language-related here, since these type
> of messages are just fragments anyway. I think the lowercase version
> is more consistent.

+1 to both
-mike
