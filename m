Message-ID: <4A5E1D1A.3090705@s5r6.in-berlin.de>
Date: Wed, 15 Jul 2009 20:16:58 +0200
From: Stefan Richter <stefanr@s5r6.in-berlin.de>
MIME-Version: 1.0
To: dedekind@infradead.org
Subject: Re: [PATCH 02/06] Fix compilation warning for fs/ubifs/commit.c
References: <20090715021901.4112.45973.sendpatchset@subratamodak.linux.ibm.com>
	<1247640750.11353.6.camel@localhost.localdomain>
In-Reply-To: <1247640750.11353.6.camel@localhost.localdomain>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: Sachin P Sant <sachinp@linux.vnet.ibm.com>,
	LKML <linux-kernel@vger.kernel.org>, David Howells <dhowells@redhat.com>,
	linux-mtd@lists.infradead.org, Adrian Hunter <adrian.hunter@nokia.com>,
	Subrata Modak <subrata@linux.vnet.ibm.com>,
	Balbir Singh <balbir@linux.vnet.ibm.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Artem Bityutskiy wrote:
> On Wed, 2009-07-15 at 07:49 +0530, Subrata Modak wrote:
>> Following fix is inspired by David Howells fix few days back:
>> http://lkml.org/lkml/2009/7/9/109,
>>
>> Signed-off-by: Subrata Modak<subrata@linux.vnet.ibm.com>,
>> ---
> 
> Removed junk comma at the end of "signed-off-by" and pushed to
> the ubifs-2.6.git tree:
> 
> http://git.infradead.org/ubifs-2.6.git?a=commit;h=5c1507e6097c4abc13bbad69de137366c9043f22
> 
> Thanks.
> 

The changelog of the patch is bad.  "Fix compilation warning" is not 
correct.  It should be "suppress compilation warning" or "annotate 
unitialized variable" or whatever --- i.e. it should say what it does. 
Furthermore, since the 3 lines context around the change in the diff do 
not reveal why the chosen "fix" is correct and desirable, the changelog 
should also leave a note why it's done this way.

The patch form David Howells which is quoted here has an equally bad 
subject, but at least its changelog goes on to explain what the patch 
really does and why it does it in the proposed way.
-- 
Stefan Richter
-=====-==--= -=== -====
http://arcgraph.de/sr/
