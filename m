Received: from relay1.mail.timico.net ([62.121.20.91] helo=relay.timico.net)
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1PxbYF-0003Cf-LC
	for linux-mtd@lists.infradead.org; Thu, 10 Mar 2011 08:48:56 +0000
From: Jon Povey <Jon.Povey@racelogic.co.uk>
To: "dedekind1@gmail.com" <dedekind1@gmail.com>, "Hunter Adrian
	(Nokia-MS/Helsinki)" <adrian.hunter@nokia.com>
Content-Class: urn:content-classes:message
Date: Thu, 10 Mar 2011 08:48:46 +0000
Subject: RE: UBIFS defaults?
Message-ID: <70E876B0EA86DD4BAF101844BC814DFE093FA87E5A@Cloud.RL.local>
In-Reply-To: <1299740676.2766.0.camel@localhost>
Content-Language: en-US
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Cc: linux-mtd <linux-mtd@lists.infradead.org>,
	Bhavesh Parekh <bhaveshparekh1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

linux-mtd-bounces@lists.infradead.org wrote:
> On Wed, 2011-03-09 at 15:01 +0200, Artem Bityutskiy wrote:
>> Hi,
>>
>> currently, UBIFS checks data CRC on read by default, i.e., the
>> 'chk_data_crc' mount option is the default one. This makes people who
>> apply benchmarks less happy, because they just use the defaults.
>>
>> Should we make the 'no_chk_data_crc' mount option to be the default
>> instead? The rationale is that people who do care to read the
>> documentation can switch to 'chk_data_crc' if they need, and people
>> who do quick UBIFS evaluation will end up with faster read speed by
>> default.
>>
>> See this section for more information about the 'no_chk_data_crc'
>> mount option:
> http://www.linux-mtd.infradead.org/doc/ubifs.html#L_checksumming
>>
>> Would be nice to hear UBIFS users' opinion.
>
> I'm  going to change the default if no one objects.

It sounds OK to me (for my uses), but:

It sounds important, I think you should wait more than 24h for comments.

--
Jon Povey
jon.povey@racelogic.co.uk

Racelogic is a limited company registered in England. Registered number 274=
3719 .
Registered Office Unit 10, Swan Business Centre, Osier Way, Buckingham, Buc=
ks, MK18 1TB .

The information contained in this electronic mail transmission is intended =
by Racelogic Ltd for the use of the named individual or entity to which it =
is directed and may contain information that is confidential or privileged.=
 If you have received this electronic mail transmission in error, please de=
lete it from your system without copying or forwarding it, and notify the s=
ender of the error by reply email so that the sender's address records can =
be corrected. The views expressed by the sender of this communication do no=
t necessarily represent those of Racelogic Ltd. Please note that Racelogic =
reserves the right to monitor e-mail communications passing through its net=
work
