Received: from mail-gg0-f177.google.com ([209.85.161.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SjWbs-0000ZE-2N
 for linux-mtd@lists.infradead.org; Tue, 26 Jun 2012 14:19:16 +0000
Received: by ggcs5 with SMTP id s5so4086616ggc.36
 for <linux-mtd@lists.infradead.org>; Tue, 26 Jun 2012 07:19:09 -0700 (PDT)
Message-ID: <4FE9C4AF.9090808@gmail.com>
Date: Tue, 26 Jun 2012 11:18:23 -0300
From: "William F." <william76.sh@gmail.com>
MIME-Version: 1.0
To: Shmulik Ladkani <shmulik.ladkani@gmail.com>
Subject: Re: [PATCH 4/8] mtd: nand: remove unused 'int' return codes (SPAM)
References: <1340408145-24531-1-git-send-email-computersforpeace@gmail.com>
 <1340408145-24531-5-git-send-email-computersforpeace@gmail.com>
 <20120626152923.5452ee5b@pixies.home.jungo.com>
In-Reply-To: <20120626152923.5452ee5b@pixies.home.jungo.com>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Em 26-06-2012 09:29, Shmulik Ladkani escreveu:
> On Fri, 22 Jun 2012 16:35:41 -0700 Brian Norris<computersforpeace@gmail.com>  wrote:
>> The return codes for read_abs_bbts() and search_read_bbts() are always
>> non-zero, and so don't have much meaning. Just remove them.
>>
>> Signed-off-by: Brian Norris<computersforpeace@gmail.com>
> Reviewed-by: Shmulik Ladkani<shmulik.ladkani@gmail.com>
>
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
>
