Received: from [119.145.14.65] (helo=szxga02-in.huawei.com)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XgrBu-0002He-CA
 for linux-mtd@lists.infradead.org; Wed, 22 Oct 2014 08:22:47 +0000
Message-ID: <5447690F.7070607@huawei.com>
Date: Wed, 22 Oct 2014 16:21:35 +0800
From: hujianyang <hujianyang@huawei.com>
MIME-Version: 1.0
To: <dedekind1@gmail.com>
Subject: Re: UBIFS assert failed in ubifs_set_page_dirty at 1421
References: <BE257DAADD2C0D439647A271332966573949EFEC@SZXEMA511-MBS.china.huawei.com>
 <1413805935.7906.225.camel@sauron.fi.intel.com> <544726CD.90902@huawei.com>
 <1413964969.7906.438.camel@sauron.fi.intel.com>
In-Reply-To: <1413964969.7906.438.camel@sauron.fi.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Cc: Caizhiyong <caizhiyong@hisilicon.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "adrian.hunter@intel.com" <adrian.hunter@intel.com>,
 Jijiagang <jijiagang@hisilicon.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 2014/10/22 16:02, Artem Bityutskiy wrote:
> On Wed, 2014-10-22 at 11:38 +0800, hujianyang wrote:
>> On 2014/10/20 19:52, Artem Bityutskiy wrote:
>>> On Thu, 2014-10-09 at 06:48 +0000, Jijiagang wrote:
>>>> Hi Artem and Adrian,
>>>>
>>>> We encountered a “UBIFS assert failed in ubifs_set_page_dirty at 1421
>>>> (pid 543)” problem when running MONKEY test in android platform.
>>>
>>> Hi, yes, this looks like a bug,
>>>
>>> could you please re-send this e-mail in plain test format, because the
>>> MTD mailing list traps HTML e-mails.
>>>
>>> Thanks!
>>>
>>
>> Hi Artem,
>>
>> My colleagues find me and complain about this problem in September. The
>> previous bug I fixed, commit 691a7c6f, didn't fix the problem they
>> tolerate now. It has a different dump stack.
> 
> Hi, it seems like MM is doing something weird. Please, reply to the
> e-mail where I CCed the MM mailing list. Getting help from them is our
> best opportunity. Describe the issue in there.
> 
> Artem.
> 
> 

Oh, I overlooked that, sorry~!

I think you've clearly described this problem, thanks! I will replay
that mail if I get something new.

I'd like to suggest them to do the same test with different kernel
version first to find something useful.
