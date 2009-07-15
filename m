Message-ID: <4A5D8D48.9060800@nokia.com>
Date: Wed, 15 Jul 2009 11:03:20 +0300
From: Adrian Hunter <adrian.hunter@nokia.com>
MIME-Version: 1.0
To: "dedekind@infradead.org" <dedekind@infradead.org>
Subject: Re: UBI resizing
References: <4A5B4EC7.9010605@youcom.nl>
	<1247565935.3828.136.camel@localhost.localdomain>
In-Reply-To: <1247565935.3828.136.camel@localhost.localdomain>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	Jelle Martijn Kok <jmkok@youcom.nl>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Artem Bityutskiy wrote:
>> I encountered (in ubidesign.pdf) "Note, that by default UBI will not 
>> reduce the size of dynamic volumes unless the number range of logical 
>> erase blocks which will be removed from the volume contains only unused 
>> blocks. A specical parameter allows to override this default.".
>> What is this "special parameter" ?
> 
> I'm not sure. Probably Adrian knows?

I don't know.

It is a UBI question I think.

http://www.linux-mtd.infradead.org/doc/ubidesign/ubidesign.pdf
