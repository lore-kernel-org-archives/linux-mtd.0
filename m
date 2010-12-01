Received: from mail-pz0-f49.google.com ([209.85.210.49])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1PNfv4-0002FV-Vp
	for linux-mtd@lists.infradead.org; Wed, 01 Dec 2010 06:11:59 +0000
Received: by pzk30 with SMTP id 30so1238846pzk.36
	for <linux-mtd@lists.infradead.org>;
	Tue, 30 Nov 2010 22:11:56 -0800 (PST)
Message-ID: <4CF5E726.3010501@gmail.com>
Date: Tue, 30 Nov 2010 22:11:50 -0800
From: Brian Norris <computersforpeace@gmail.com>
MIME-Version: 1.0
To: Mike Frysinger <vapier.adi@gmail.com>
Subject: Re: [PATCH 7/8] nandwrite: add check for negative blockalign
References: <1291017722-23985-1-git-send-email-computersforpeace@gmail.com>
	<1291017722-23985-7-git-send-email-computersforpeace@gmail.com>
	<AANLkTi==NGjgX38mUKfziKQAknmOJyZmB4Db3WPEh5MJ@mail.gmail.com>
In-Reply-To: <AANLkTi==NGjgX38mUKfziKQAknmOJyZmB4Db3WPEh5MJ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: David Woodhouse <dwmw2@infradead.org>,
	Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org,
	Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 11/29/2010 12:05 AM, Mike Frysinger wrote:
> On Mon, Nov 29, 2010 at 03:02, Brian Norris wrote:
>> +               errmsg_die("Can't specify a negative blockalign '%d'",
>> +                               blockalign);
> 
> personally, i'd avoid quotes on non-string types.  maybe also mention
> the command line option that is "blockalign" ?

I'm sending some "v2" patches related to these err messages. I'm not
sure what the best, descriptive messages are, but I tried.

Brian
