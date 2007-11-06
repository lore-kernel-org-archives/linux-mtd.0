Received: from smtp.nokia.com ([131.228.20.173] helo=mgw-ext14.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.66 #1 (Red Hat Linux))
	id 1IpIhT-0001aB-50
	for linux-mtd@lists.infradead.org; Tue, 06 Nov 2007 02:18:21 -0500
Message-ID: <4730144D.2030604@nokia.com>
Date: Tue, 06 Nov 2007 09:14:21 +0200
From: Adrian Hunter <ext-adrian.hunter@nokia.com>
MIME-Version: 1.0
To: =?UTF-8?B?ZXh0IErDtnJuIEVuZ2Vs?= <joern@logfs.org>
Subject: Re: [PATCH] [MTD] [OneNAND] Do not stop reading for ECC errors
References: <472B0A3C.4010103@nokia.com>
	<20071105132512.GA19232@lazybastard.org>
	<472F2CB5.6090409@nokia.com>
	<20071105162321.GA21533@lazybastard.org>
In-Reply-To: <20071105162321.GA21533@lazybastard.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org, kmpark@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

ext Jörn Engel wrote:
> On Mon, 5 November 2007 16:46:13 +0200, Adrian Hunter wrote:
>> -EBADMSG is an ECC error.
>>
>> ret must be non-zero to indicate that the bufferram is invalid.  Otherwise
>> if we read from the same location again, the data would be taken from 
>> bufferram
>> and no ECC error would be reported.  However we need to keep reading (see 
>> nand_base.c)
>> so ret is set to zero as though no error occured.  Finally 
>> mtd->ecc_stats.failed
>> is examined to determine ECC errors. i.e.
> 
> Hmm.
> 
>> static int onenand_read(struct mtd_info *mtd, loff_t from, size_t len,
>> 	size_t *retlen, u_char *buf)
>> {
>> 	...
>> 	stats = mtd->ecc_stats;
>> 	...
>> 	while (!ret) {
>> 		...
>> 		ret = this->wait(mtd, FL_READING);
>> 		onenand_update_bufferram(mtd, from, !ret);
>> 		if (ret == -EBADMSG)
>> 			ret = 0;
>> 	}
>> 	*retlen = read;
>> 	if (mtd->ecc_stats.failed - stats.failed)
>> 		return -EBADMSG;
>> 	if (ret)
>> 		return ret;
> 
> Those two conditionals should have reversed order, imo.

Very true.  I have added that fix to the patch also - see next mail.

> 
>>> What about -EUCLEAN?
>> The wait function doesn't return -EUCLEAN.  It increments 
>> mtd->ecc_stats.corrected and returns
>> zero for correctable ECC errors.
>>
>> File systems (like say JFFS2 for example) don't expect -EUCLEAN from 
>> mtd->read_oob and would treat
>> it as a fatal error, so it must not be returned in this case.
> 
> Such an interface sure looks strange.  But since read_oob is strange
> anyway I don't care very much either way.
> 
> Jörn
> 
