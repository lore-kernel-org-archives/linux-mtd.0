Received: from smtp.newsguy.com ([74.209.136.69])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1S7Zyu-0007X4-FD
 for linux-mtd@lists.infradead.org; Tue, 13 Mar 2012 22:14:13 +0000
Received: from [192.168.12.102] (182.sub-166-250-18.myvzw.com [166.250.18.182])
 by smtp.newsguy.com (8.14.3/8.14.3) with ESMTP id q2DME84r013075
 (version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256 verify=NO)
 for <linux-mtd@lists.infradead.org>; Tue, 13 Mar 2012 15:14:09 -0700 (PDT)
 (envelope-from mikedunn@newsguy.com)
Message-ID: <4F5FC6AC.9050707@newsguy.com>
Date: Tue, 13 Mar 2012 15:14:04 -0700
From: Mike Dunn <mikedunn@newsguy.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: Re: [PATCH 0/4] MTD: Change meaning of -EUCLEAN return code on reads
References: <1331500873-9792-1-git-send-email-mikedunn@newsguy.com>
 <1331640228.3595.19.camel@sauron.fi.intel.com> <4F5F87E6.7010301@newsguy.com>
In-Reply-To: <4F5F87E6.7010301@newsguy.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 03/13/2012 10:46 AM, Mike Dunn wrote:
>>
>> I'd be pro-active and just CC'ed maintainers/possibly relevant people.
>> scripts/get_maintainer.pl would give you the ones, I think. Just spend a
>> little time and come up with a list of people and CC them.
> 
> 
> I actually did do this, and git-send-email kept rejecting it because of "too
> many recipients" or some such.  After several iterations of trying to
> intelligently whittle down the CC list and getting the same result, I got
> frustrated and just CC'd Ivan.  (Hope you don't mind, Ivan :) Anyone know how
> many recipients git allows?


This is my smtp server rejecting it, not git.  Apparently it has an absurdly low
limit to the number of recipients.
