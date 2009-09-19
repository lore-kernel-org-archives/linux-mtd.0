Received: from mail-px0-f190.google.com ([209.85.216.190])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1MooqO-0000WT-7d
	for linux-mtd@lists.infradead.org; Sat, 19 Sep 2009 01:34:37 +0000
Received: by pxi28 with SMTP id 28so1143708pxi.2
	for <linux-mtd@lists.infradead.org>;
	Fri, 18 Sep 2009 18:34:30 -0700 (PDT)
MIME-Version: 1.0
Sender: kyungmin78@gmail.com
In-Reply-To: <4AB33D32.8070109@nokia.com>
References: <9c9fda240909180026x7183ccecw9a1a3430090787a3@mail.gmail.com>
	<4AB33D32.8070109@nokia.com>
Date: Sat, 19 Sep 2009 10:34:30 +0900
Message-ID: <9c9fda240909181834y3b409f2ewb7b07c351ec82670@mail.gmail.com>
Subject: Re: UBIFS warning: ubifs_vm_page_mkwrite: out of space for mmapped
	file
From: Kyungmin Park <kmpark@infradead.org>
To: Adrian Hunter <adrian.hunter@nokia.com>
Content-Type: text/plain; charset=ISO-8859-1
Cc: "Bityutskiy Artem \(Nokia-D/Helsinki\)" <Artem.Bityutskiy@nokia.com>,
	linux-mtd Mailing List <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

On Fri, Sep 18, 2009 at 4:56 PM, Adrian Hunter <adrian.hunter@nokia.com> wrote:
> Kyungmin Park wrote:
>>
>> Hi,
>>
>> Do you have any clue of following message?
>>
>> We used the latest UBIFS.
>>
>> [21474583.825000] UBIFS warning (pid 1263): ubifs_vm_page_mkwrite: out
>> of space for mmapped file (inode number 2180)
>> [21474583.830000] UBIFS warning (pid 1263): ubifs_vm_page_mkwrite: out
>> of space for mmapped file (inode number 2180)
>> [21474584.190000] UBIFS warning (pid 1362): ubifs_vm_page_mkwrite: out
>> of space for mmapped file (inode number 2180)
>> [21474584.200000] UBIFS warning (pid 1362): ubifs_vm_page_mkwrite: out
>> of space for mmapped file (inode number 2180)
>
> Unlike a block-based file system, in UBIFS if you mmap a file and write to
> it, you can run out of space.
>
> (Actually you can also run out of space on a block-based file system that
> implements sparse files and you write into a hole)

Thank you for your hint.
I try to find out the reason. As you said it's run out of space.

Thank you,
Kyungmin Park
