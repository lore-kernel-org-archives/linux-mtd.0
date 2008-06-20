Received: from rn-out-0910.google.com ([64.233.170.187])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1K9jQI-0007gP-Av
	for linux-mtd@lists.infradead.org; Fri, 20 Jun 2008 16:25:14 +0000
Received: by rn-out-0910.google.com with SMTP id m7so197032rnd.3
	for <linux-mtd@lists.infradead.org>;
	Fri, 20 Jun 2008 09:25:13 -0700 (PDT)
Message-ID: <8bd0f97a0806200925i7b653355m25f8d6f3e4d49eeb@mail.gmail.com>
Date: Fri, 20 Jun 2008 12:25:13 -0400
From: "Mike Frysinger" <vapier.adi@gmail.com>
To: "Grant Erickson" <erick205@umn.edu>
Subject: Re: mkfs.jffs2: creating dirs in /
In-Reply-To: <C481276A.FE21%erick205@umn.edu>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <8bd0f97a0806200828u2aefc887n37cb48b4cf75528b@mail.gmail.com>
	<C481276A.FE21%erick205@umn.edu>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Jun 20, 2008 at 12:22 PM, Grant Erickson wrote:
> On 6/20/08 8:28 AM, Mike Frysinger wrote:
>> with older mtd-utils, creating a directory in the root worked fine.
>> with current git, the parent dir search algo breaks this.
>>
>> for example, just take the current git tree, build it up, and then run:
>> $ ./mkfs.jffs2 -d . -D device_table.txt -o /dev/null
>> mkfs.jffs2: skipping device_table entry '/dev': no parent directory!
>> mkfs.jffs2: skipping device_table entry '/dev/mem': no parent directory!
>> ...
>> doing `mkdir dev` first works around the issue, but where's the fun in that.
>>
>> locally i just made the change to interpret_table_entry() where it
>> looks to see if the dir is "/" and if so, uses "root" rather than
>> calling find_filesystem_entry(), but i dont think that's the right
>> long term fix.  i pondered the find_filesystem_entry() function for a
>> while, but the closest i found was to delete the first if statement
>> and then tweak the fullname[len] ...
>> -mike
>
> Mike,
>
> I just submitted several patches earlier last week to fix what appears to be
> a similar issue:
>
> See:
>
>    http://lists.infradead.org/pipermail/linux-mtd/2008-June/021997.html
>    http://lists.infradead.org/pipermail/linux-mtd/2008-June/022008.html
>    http://lists.infradead.org/pipermail/linux-mtd/2008-June/022058.html
>
> Have you picked/merged up these changes from GIT?

i'm using the very latest git.  so unless something got merged in the
last hour ...
-mike
