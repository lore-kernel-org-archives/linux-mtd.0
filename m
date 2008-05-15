Received: from fg-out-1718.google.com ([72.14.220.157])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1Jwaf1-0008NL-5O
	for linux-mtd@lists.infradead.org; Thu, 15 May 2008 10:26:07 +0000
Received: by fg-out-1718.google.com with SMTP id l26so305327fgb.26
	for <linux-mtd@lists.infradead.org>;
	Thu, 15 May 2008 03:26:03 -0700 (PDT)
Message-ID: <b104e0e40805150326s2b2a582emc92d1332e9f6831f@mail.gmail.com>
Date: Thu, 15 May 2008 18:26:03 +0800
From: "yang chen" <yangchen.mot@gmail.com>
To: "veena s" <veena_3_2003@yahoo.co.in>, linux-mtd@lists.infradead.org
Subject: Re: Reg:FAT support for NAND
In-Reply-To: <499493.45555.qm@web8613.mail.in.yahoo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <b104e0e40805122035h389d7728p61fd32559f01f2bd@mail.gmail.com>
	<499493.45555.qm@web8613.mail.in.yahoo.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I forgot replying the mail to mtd maillist.  sorry.

2008/5/15 veena s <veena_3_2003@yahoo.co.in>:
>
>
> Hi Chan ,
> Thanks a lot i tried with this it is working fine ....
>
> Regards
> Veena
>
>
> --- yang chen <yangchen.mot@gmail.com> wrote:
>
>> why not use vfat over jffs2 ?  you can mount your
>> partition as jffs2
>> first , then create a vfat image (a file) in it.
>> then loop back the
>> file as loopback device ,then mount the loopback
>> device as vfat, so
>> that your vfat image can use jffs2' wear levelling.
>>
>> -Yang
>>
>>
>>
>> 2008/5/12 veena s <veena_3_2003@yahoo.co.in>:
>> > Hi ,
>> >
>> >
>> >  I want to Use FAT Filesystem for NAND in the
>> Linux
>> >  Kernel ver-2.6.10.
>> >  We have tried by enabling NFTL layer . But we are
>> >  facing the following  problem to mount  with
>> FAT.....
>> >
>> >  1 ) nftl_format : utility is used to format the
>> device
>> >  requires the erase size to be 8k bytes, but our
>> device
>> >  has erase size of 128kbytes.so nftl_format is not
>> able
>> >  to recognise the erase size.
>> >
>> >  2 ) We have created the device nodes as
>> /dev/nftla and
>> >  tried to mount FAT over it using the following
>> >  command.
>> >
>> >  mount -tvfat /dev/nftla /mnt/nand
>> >  but above command is failing.
>> >
>> >  So please suggest whether the above steps are
>> >  correct.?
>> >  and help us how to use FAT over NAND.
>> >
>> >  Thanks
>> >
>> >
>> >
>> >
>> >       Planet Earth is in the hot seat. Know more -
>>
> http://in.search.yahoo.com/search?&fr=na_onnetwork_mail_taglines&ei=UTF-8&rd=r1&p=global+warming
>> >
>> >
>>
> ______________________________________________________
>> >  Linux MTD discussion mailing list
>> >
>>
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
>> >
>>
>>
>>
>> --
>> -Yang
>>
>
>
>
>      Check out the all-new face of Yahoo! India. Go to http://in.yahoo.com/
>
>



-- 
-Yang
