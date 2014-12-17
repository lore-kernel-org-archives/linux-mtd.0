Received: from mail-ie0-x234.google.com ([2607:f8b0:4001:c03::234])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Y13x2-00019V-A4
 for linux-mtd@lists.infradead.org; Wed, 17 Dec 2014 02:02:56 +0000
Received: by mail-ie0-f180.google.com with SMTP id rp18so13665207iec.25
 for <linux-mtd@lists.infradead.org>; Tue, 16 Dec 2014 18:02:34 -0800 (PST)
Message-ID: <5490E436.7020200@gmail.com>
Date: Tue, 16 Dec 2014 21:02:30 -0500
From: nick <xerofoify@gmail.com>
MIME-Version: 1.0
To: Brian Norris <computersforpeace@gmail.com>,
 Liu Song <liu.song11@zte.com.cn>
Subject: Re: [PATCH]jffs2:bugfix for should not appeared directory hard link
References: <OFA26F19B7.DF3A70A5-ON48257D7B.00265361-48257D7B.0033C198@zte.com.cn>
 <20141105114500.GM22361@norris-Latitude-E6410>
 <OFC7724A44.98471338-ON48257D8E.00241A97-48257D8E.00250734@zte.com.cn>
 <20141217015338.GR9759@ld-irv-0074>
In-Reply-To: <20141217015338.GR9759@ld-irv-0074>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Cc: cui.yunfeng@zte.com.cn, Artem Bityutskiy <dedekind1@gmail.com>,
 linux-mtd@lists.infradead.org, jiang.xuexin@zte.com.cn, wang.bo116@zte.com.cn,
 dwmw2@infradead.org, deng.chao1@zte.com.cn
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Greetings Brian,
Are you sure jffs2 is obsolete now? I seem to known of a few areas in embedded that are still using this file system unless we are moving toward f2fs for flash file systems. If that is the case why not just remove it from main line as
no one is supporting it outside legacy code for older devices and embedded systems.
Regards Nick 

On 2014-12-16 08:53 PM, Brian Norris wrote:
>> > Thanks a lot for your attention and suggestions. Follow the guide, patch had checked by checkpatch.pl,
>> > but there also had warnings about line over 80 characters, I had no idea to fix that except remove the
>> > code indentations, but i'm afraid that would make codes hard to read. However, if there are any
>> > suggestions to fix this I would try.
> Sometimes you can break a line in the middle, where necessar
