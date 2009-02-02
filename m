Received: from mailout1.samsung.com ([203.254.224.24])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1LTvnP-0008PE-2q
	for linux-mtd@lists.infradead.org; Mon, 02 Feb 2009 10:12:54 +0000
Received: from epmmp1 (mailout1.samsung.com [203.254.224.24])
	by mailout1.samsung.com
	(iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
	with ESMTP id <0KEF00L46OD57P@mailout1.samsung.com> for
	linux-mtd@lists.infradead.org; Mon, 02 Feb 2009 19:12:41 +0900 (KST)
Received: from amitksharma ([107.108.214.35])
	by mmp1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14
	2004)) with ESMTPA id <0KEF008ZGOD0S0@mmp1.samsung.com> for
	linux-mtd@lists.infradead.org; Mon, 02 Feb 2009 19:12:38 +0900 (KST)
Date: Mon, 02 Feb 2009 15:47:14 +0530
From: Amit Kumar Sharma <amitsharma.9@samsung.com>
Subject: Re: Regarding UBI scalability
To: dedekind@infradead.org, brij.singh@samsung.com
Message-id: <618F1BB69C6C43C895C260C527C4F159@sisodomain.com>
Content-transfer-encoding: 7BIT
References: <31956721.196931233319535527.JavaMail.weblogic@epml10>
	<1233567078.7085.62.camel@localhost.localdomain>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi
----- Original Message ----- 
From: "Artem Bityutskiy" <dedekind@infradead.org>
To: <brij.singh@samsung.com>
Cc: <linux-mtd@lists.infradead.org>
Sent: Monday, February 02, 2009 3:01 PM
Subject: Re: Regarding UBI scalability


> On Fri, 2009-01-30 at 12:45 +0000, BRIJESH SINGH wrote:
>> Hi,
>>     I have gone through UBI documentation which clearly 
>> mentions that
>> UBI doesn't scale very well.(Boot time and Memory 
>> consumption
>> increases with size of device.)This is very similar to 
>> JFFS2
>> scalability issues. Log, journal(like UBIFS LPT) 
>> combination might
>> surely help on this issue.
>
> Right
>
>>   I would like to work on this enhancement with the 
>> community. Before
>> that I just wanted to check if any one is already working 
>> on it.
>
> No, I do not think so.
>
>>   As this a well known issue, I am sure somebody will 
>> have some design
>> suggestions. Any design suggestions will be appreciated.
>
> You could look at the old JFFS3 design document:
>
> http://www.linux-mtd.infradead.org/doc/JFFS3design.pdf
>
> at the "The superblock" section, which describes the idea 
> of how to have
> a data structure which refers everything else in the 
> media: journal,
> root nodes of the trees, etc.
>
> An then you should think about how to store the EBA table 
> on flash. And
> how to store the erase counters on the flash. Many ideas 
> may be borrowed
> from UBIFS in this area.
>
> I may help you in terms of design suggestions / review, 
> and some code
> review. But I do not really have time to seriously work on 
> this.
>
> -- 
> Best regards,
> Artem Bityutskiy (???????? ?????)

Thanks for your comments Brijesh will check all your 
suggestion and we will discuss final design with you for 
your comments.

Thanks
Amit
>
>
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
> 
