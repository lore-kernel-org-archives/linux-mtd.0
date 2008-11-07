Message-ID: <49140258.1040001@nokia.com>
Date: Fri, 07 Nov 2008 10:54:48 +0200
From: Adrian Hunter <ext-adrian.hunter@nokia.com>
MIME-Version: 1.0
To: dedekind@infradead.org
Subject: Re: [PATCH 4/4] [MTD] nandsim: add option to use a file to cache pages
References: <483FF983.9050305@nokia.com> <1225964898.26460.27.camel@sauron>
In-Reply-To: <1225964898.26460.27.camel@sauron>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Artem Bityutskiy wrote:
> On Fri, 2008-05-30 at 15:56 +0300, Adrian Hunter wrote:
>> Add a new optional module parameter 'cache_file' which causes
>> nandsim to use that file instead of memory to cache nand data.
>> Using a file allows the simulation of NAND that is bigger
>> than the available memory.
> 
> Hi,
> 
> What is the fate of this patch?
> 

Needs more work
