Message-ID: <4AB33D32.8070109@nokia.com>
Date: Fri, 18 Sep 2009 10:56:34 +0300
From: Adrian Hunter <adrian.hunter@nokia.com>
MIME-Version: 1.0
To: Kyungmin Park <kmpark@infradead.org>
Subject: Re: UBIFS warning: ubifs_vm_page_mkwrite: out of space for mmapped
	file
References: <9c9fda240909180026x7183ccecw9a1a3430090787a3@mail.gmail.com>
In-Reply-To: <9c9fda240909180026x7183ccecw9a1a3430090787a3@mail.gmail.com>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
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

Kyungmin Park wrote:
> Hi,
> 
> Do you have any clue of following message?
> 
> We used the latest UBIFS.
> 
> [21474583.825000] UBIFS warning (pid 1263): ubifs_vm_page_mkwrite: out
> of space for mmapped file (inode number 2180)
> [21474583.830000] UBIFS warning (pid 1263): ubifs_vm_page_mkwrite: out
> of space for mmapped file (inode number 2180)
> [21474584.190000] UBIFS warning (pid 1362): ubifs_vm_page_mkwrite: out
> of space for mmapped file (inode number 2180)
> [21474584.200000] UBIFS warning (pid 1362): ubifs_vm_page_mkwrite: out
> of space for mmapped file (inode number 2180)

Unlike a block-based file system, in UBIFS if you mmap a file and write to it, 
you can run out of space.

(Actually you can also run out of space on a block-based file system that
implements sparse files and you write into a hole)
