Received: from smtp6-v.fe.bosch.de ([2a03:cc00:ff0:100::2])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UoXVI-0004Ut-EI
 for linux-mtd@lists.infradead.org; Mon, 17 Jun 2013 11:21:46 +0000
From: "Prins Anton (ST-CO/ENG1.1)" <Anton.Prins@nl.bosch.com>
To: =?iso-8859-1?Q?Mats_K=E4rrman?= <Mats.Karrman@tritech.se>, Adrian Hunter
 <adrian.hunter@intel.com>
Date: Mon, 17 Jun 2013 13:20:49 +0200
Subject: RE: UBIFS failure & stable page writes
Message-ID: <85D877DD6EE67B4A9FCA9B9C3A4865670C3F41650D@SI-MBX14.de.bosch.com>
References: <85D877DD6EE67B4A9FCA9B9C3A4865670C3E8CB9B7@SI-MBX14.de.bosch.com>
 <20130527121828.GA32625@quack.suse.cz>
 <85D877DD6EE67B4A9FCA9B9C3A4865670C3E8CBB8D@SI-MBX14.de.bosch.com>
 <1369709828.5446.89.camel@sauron.fi.intel.com>
 <85D877DD6EE67B4A9FCA9B9C3A4865670C3E8CBD81@SI-MBX14.de.bosch.com>
 <1369727042.5446.112.camel@sauron.fi.intel.com>
 <85D877DD6EE67B4A9FCA9B9C3A4865670C3E8CBE33@SI-MBX14.de.bosch.com>
 <1369732266.5446.117.camel@sauron.fi.intel.com>
 <85D877DD6EE67B4A9FCA9B9C3A4865670C3E91DC9C@SI-MBX14.de.bosch.com>
 <1369810158.5446.208.camel@sauron.fi.intel.com>
 <85D877DD6EE67B4A9FCA9B9C3A4865670C3E91E697@SI-MBX14.de.bosch.com>
 <1370239282.21714.21.camel@sauron.fi.intel.com>
 <85D877DD6EE67B4A9FCA9B9C3A4865670C3EA0F38E@SI-MBX14.de.bosch.com>
 <51B82A1D.30009@intel.com>
 <85D877DD6EE67B4A9FCA9B9C3A4865670C3F1A3508@SI-MBX14.de.bosch.com>
 <51B862D6.2080807@intel.com>
 <85D877DD6EE67B4A9FCA9B9C3A4865670C3F1A3590@SI-MBX14.de.bosch.com>
 <51B87315.7090808@intel.com>,
 <85D877DD6EE67B4A9FCA9B9C3A4865670C3F1A36BC@SI-MBX14.de.bosch.com>
 <ED3E0BCACD909541BA94A34C4A164D4C4FC8F091@post.tritech.se>,
 <85D877DD6EE67B4A9FCA9B9C3A4865670C3F1A3D7F@SI-MBX14.de.bosch.com>
 <ED3E0BCACD909541BA94A34C4A164D4C4FC8FD66@post.tritech.se>
In-Reply-To: <ED3E0BCACD909541BA94A34C4A164D4C4FC8FD66@post.tritech.se>
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "dedekind1@gmail.com" <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Thanks Mats for your information; hopefully the 'double free' patches will =
solve something!

Over here we did run a test over the weekend with 70 devices and the loggin=
g as mentioned in previous messages.
(without the 'double free' patches mentioned earlier, this to be able to po=
int to a root-cause).=20
Next to the logging we did binary analyze LEB9.

The results is that the 70 devices in total had 88 writes to the orphan are=
a of node 0.. (ranging from 0 to 5 node 0 writes on a single device).
We also analyzed the 70 LEB9s which gave the same total of 88 node 0's insi=
de them.

These writes of node 0 did not turn in a reboot-failure or any other proble=
m;=20
So I expect a second scenario where node 1 is written, but not yet seen in =
any logging up to now!

Adrian, when will de orphan area be 'cleaned'?=20
May I analyze it after reboot/recovery as well?

Now we know about our logging of 'node 0'; we will apply the patches and ch=
eck the log-results in this case.
A subset of our devices; I will keep in the old-scenario to test for node-1=
 logging (and reboot failures)

Adrian, could there be a way to trigger the problem that the 'double free' =
patch solves, more often?

Thanks in Advance,

Anton
