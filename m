Received: from web8103.in.yahoo.com ([203.199.70.30])
	by pentafluge.infradead.org with smtp (Exim 3.22 #1 (Red Hat Linux))
	id 168Jnh-0002pG-00
	for <linux-mtd@lists.infradead.org>; Mon, 26 Nov 2001 11:19:49 +0000
Message-ID: <20011126113018.75653.qmail@web8103.in.yahoo.com>
Date: Mon, 26 Nov 2001 11:30:18 +0000 (GMT)
From: =?iso-8859-1?q?somshekar=20kadam?= <kadamsom@yahoo.co.in>
Subject: Re: jffs2 ls hangs
To: Ashok M Padmanaban <ashokmp@sasken.com>,
  MTD for Linux <linux-mtd@lists.infradead.org>,
  JFFS mailing list <jffs-dev@axis.com>
In-Reply-To: <3C025F36.95DBF879@sasken.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

hi ashok,
    even i have faced the same problem i use 2.4.1
    when i copy small files its okay but for large
files its gives message as freeing accounting screwed
as same what u are getting if find any solution let me
know
som
HCL TECHNOLOGIES


 --- Ashok M Padmanaban <ashokmp@sasken.com> wrote: >
hi all,
>  I am not able to make out what is going  wrong
> Till date i did not have this problem
> Iam using
> linux 2.4.8 , with following patches
>  patch -2.4.8-ac12
>  patch -2.4.8-ac12-rmk1
>  diff -2.4.8-ac12-rmk1-np2
> 
> Iam doing an erase on the mtd, then dd a jffs2 image
> on to it,
> then mount it, it says
> Jffs2: No clean_or_dirty blocks to GC from! where
> are they all?
> jffs2 :Couln't find erase block to garbage collect?
> 
> which happens if there are very few no. of files in
> the partition.
> 
> Iam able to succesfully mount the partition and
> create small files and
> do ls to
> display them
> but when i copy a big file say (1MB file) to the 13
> MB partition and do
> an ls it hangs.
> 
> But last week i was actually downloading 7MB files
> and was able to
> succesfully able to do an ls.
> I dont know what went wrong.
> 
> Thanks in advance
> 
> regards
> ashok
> 
> 
> 
> 
> 
> 
>
______________________________________________________
> Linux MTD discussion mailing list
>
http://lists.infradead.org/mailman/listinfo/linux-mtd/ 

____________________________________________________________
  *NEW*   over 2200 active jobs at Yahoo! Careers   *NEW*
            Visit http://in.careers.yahoo.com/
